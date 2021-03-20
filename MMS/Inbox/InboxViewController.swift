//
//  InboxViewController.swift
//  MMS
//
//  Created by AJ on 20/03/21.
//

import UIKit

class InboxViewController: UIViewController {
    var inboxDetails : DashBoardModel?
    @IBOutlet weak var inboxCollectionView: UICollectionView!
    var subSectionsCount: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        inboxDetails = JsonHelper().getDataFromJson(jsonResourceName: "InboxDetails", data: DashBoardModel.self)
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    fileprivate func registerCells() {
        self.inboxCollectionView.registerNibs(nibName: AppConstants.dashBoardCollectionViewCell, cellReuseIdentifier: AppConstants.dashBoardCVCIdentifier)
        self.inboxCollectionView.registerNibs(nibName: AppConstants.dashBoardHeaderCollectionViewCell, cellReuseIdentifier: AppConstants.dashBoardHCVCIdentifier)
    }
}

extension InboxViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return inboxDetails?.dashBoardSections.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        subSectionsCount = inboxDetails?.dashBoardSections[section].subSections.count ?? 0
        return subSectionsCount + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == AppConstants.firstIndexPath {
            guard let cell = inboxCollectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.dashBoardHCVCIdentifier, for: indexPath) as? DashBoardHeaderCollectionViewCell else { return UICollectionViewCell() }
            let sectionHeader = inboxDetails?.dashBoardSections[indexPath.section].sectionHeader ?? ""
            cell.setSectionHeaderData(sectionHeader: sectionHeader)
            return cell
        }
        guard let cell = inboxCollectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.dashBoardCVCIdentifier, for: indexPath) as? DashBoardCollectionViewCell else { return UICollectionViewCell() }
        let subSectionDetails = inboxDetails?.dashBoardSections[indexPath.section].subSections[indexPath.item-1]
        cell.setSubSectionData(data: subSectionDetails, isComingFrom: .Inbox)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected")
    }
}

extension InboxViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - AppConstants.dashBoardCVCHalfWidthConstraint) / AppConstants.fractionOfTwo
        if indexPath.item == AppConstants.firstIndexPath {
            return CGSize(width: collectionView.frame.size.width, height: AppConstants.collectionViewCellHeight/AppConstants.fractionOfTwo)
        }
        let count = inboxDetails?.dashBoardSections[indexPath.section].subSections.count ?? 0
        if DashBoardViewModel().shouldShowCellWithFullWidth(subsectionsCount: count, indexPath: indexPath.item) {
            return CGSize(width: collectionView.frame.size.width - AppConstants.dashBoardCVCFullWithConstraint, height: AppConstants.collectionViewCellHeight)
        }
        return CGSize(width: width, height: AppConstants.collectionViewCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidthPadding: CGFloat = collectionView.frame.size.width / AppConstants.dashBoardSectionWidthPaddingFraction
        let cellHeightPadding: CGFloat = AppConstants.dashBoardSectionsHeightPadding
        return UIEdgeInsets(top: cellHeightPadding,left: cellWidthPadding, bottom: cellHeightPadding,right: cellWidthPadding)
    }
}
