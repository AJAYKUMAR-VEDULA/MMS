//
//  DashBoardViewController.swift
//  MMS
//
//  Created by AJ on 01/03/21.
//

import UIKit

class DashBoardViewController: UIViewController {

    @IBOutlet weak var dashBoardCollectionView: UICollectionView!
    var dashBoardDetails: DashBoardModel?
    var subSectionsCount: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        dashBoardDetails = JsonHelper().getDataFromJson(jsonResourceName: "DashBoardDetails", data: DashBoardModel.self)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    
    fileprivate func registerCells() {
        registerNibs(nibName: AppConstants.dashBoardCollectionViewCell, cellReuseIdentifier: AppConstants.dashBoardCVCIdentifier)
        registerNibs(nibName: AppConstants.dashBoardHeaderCollectionViewCell, cellReuseIdentifier: AppConstants.dashBoardHCVCIdentifier)
    }
    
    
    func registerNibs(nibName: String, cellReuseIdentifier: String) {
        self.dashBoardCollectionView.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
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
        cell.setSubSectionData(data: subSectionDetails)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected")
    }
}


extension DashBoardViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - AppConstants.dashBoardCVCHalfWidthConstraint) / AppConstants.fractionOfTwo
        if indexPath.item == AppConstants.firstIndexPath {
            return CGSize(width: collectionView.frame.size.width, height: AppConstants.collectionViewCellHeight/AppConstants.fractionOfTwo)
        }
        if DashBoardViewModel().shouldShowCellWithFullWidth(subsectionsCount: subSectionsCount, indexPath: indexPath.item) {
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
