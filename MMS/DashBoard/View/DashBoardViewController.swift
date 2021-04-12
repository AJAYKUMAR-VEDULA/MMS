//
//  DashBoardViewController.swift
//  MMS
//
//  Created by AJ on 01/03/21.
//

import UIKit

class DashBoardViewController: UIViewController {
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuLeadingContraint: NSLayoutConstraint!
    @IBOutlet weak var menuBackGroundView: UIView!
    @IBOutlet weak var dashBoardCollectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    var dashBoardDetails: DashBoardModel?
    var subSectionsCount: Int = 0
    var menuWallDetails = ["DashBoard", "Approval Inbox", "Transaction", "Inter Unit Transaction", "Procurement", "Contact Us", "Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        dashBoardDetails = JsonHelper().getDataFromJson(jsonResourceName: AppConstants.dshBoardDetails, data: DashBoardModel.self)
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func setView() {
        self.title = "MMS"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Menu"), style: .plain, target: self, action: #selector(menuButtonTap))
        menuLeadingContraint.constant = -(self.view.frame.width * 0.8)
        menuBackGroundView.isHidden = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideMenuWall))
        menuBackGroundView.addGestureRecognizer(tapGesture)
        nameLabel.text = "Name: Ajay Kumar"
        designationLabel.text = "Designation: Associate"
    }
    
    @objc func menuButtonTap() {
        if menuBackGroundView.isHidden {
            self.navigationController?.navigationBar.isHidden = true
            menuLeadingContraint.constant = 0
            menuBackGroundView.isHidden = false
        }
    }
    
    @objc func hideMenuWall() {
        if !menuBackGroundView.isHidden {
            self.navigationController?.navigationBar.isHidden = false
            menuLeadingContraint.constant = -(self.view.frame.width * 0.8)
            menuBackGroundView.isHidden = true
        }
    }
    
    
    fileprivate func registerCells() {
        self.dashBoardCollectionView.registerNibs(nibName: AppConstants.dashBoardCollectionViewCell, cellReuseIdentifier: AppConstants.dashBoardCVCIdentifier)
        self.dashBoardCollectionView.registerNibs(nibName: AppConstants.dashBoardHeaderCollectionViewCell, cellReuseIdentifier: AppConstants.dashBoardHCVCIdentifier)
        self.menuTableView.registerNibs(nibName: "MenuWallTableViewCell", cellReuseIdentifier: "menuWallCell")
    }
}

extension DashBoardViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dashBoardDetails?.dashBoardSections.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        subSectionsCount = dashBoardDetails?.dashBoardSections[section].subSections.count ?? 0
        return subSectionsCount + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == AppConstants.firstIndexPath {
            guard let cell = dashBoardCollectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.dashBoardHCVCIdentifier, for: indexPath) as? DashBoardHeaderCollectionViewCell else { return UICollectionViewCell() }
            let sectionHeader = dashBoardDetails?.dashBoardSections[indexPath.section].sectionHeader ?? ""
            cell.setSectionHeaderData(sectionHeader: sectionHeader)
            return cell
        }
        guard let cell = dashBoardCollectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.dashBoardCVCIdentifier, for: indexPath) as? DashBoardCollectionViewCell else { return UICollectionViewCell() }
        let subSectionDetails = dashBoardDetails?.dashBoardSections[indexPath.section].subSections[indexPath.item-1]
        cell.setSubSectionData(data: subSectionDetails, isComingFrom: .HomeDashBoard)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected")
        let hasNextlevel = dashBoardDetails?.dashBoardSections[indexPath.section].hasNextlevel ?? false
        guard let inboxViewController = self.storyboard?.instantiateViewController(identifier: "inboxViewController") as? InboxViewController, hasNextlevel else { return }
        self.navigationController?.pushViewController(inboxViewController, animated: true)
    }
}


extension DashBoardViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - AppConstants.dashBoardCVCHalfWidthConstraint) / AppConstants.fractionOfTwo
        if indexPath.item == AppConstants.firstIndexPath {
            return CGSize(width: collectionView.frame.size.width, height: AppConstants.collectionViewCellHeight/AppConstants.fractionOfTwo)
        }
        let count = dashBoardDetails?.dashBoardSections[indexPath.section].subSections.count ?? 0
        if DashBoardViewModel().shouldShowCellWithFullWidth(subsectionsCount: count, indexPath: indexPath.item) {
            return CGSize(width: collectionView.frame.size.width - AppConstants.dashBoardCVCFullWithConstraint, height: AppConstants.collectionViewCellHeight)
        }
        return CGSize(width: width, height: AppConstants.collectionViewCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return AppConstants.sectionPadding
    }
}

extension DashBoardViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuWallDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = menuTableView.dequeueReusableCell(withIdentifier: "menuWallCell", for: indexPath) as? MenuWallTableViewCell else {
            return UITableViewCell()
        }
        cell.setData(data: menuWallDetails[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == menuWallDetails.count - 1 {
            self.navigationController?.popViewController(animated: true)
        } else {
            hideMenuWall()
        }
    }
    
}
