//
//  DashBoardCollectionViewCell.swift
//  MMS
//
//  Created by AJ on 06/03/21.
//

import UIKit

class DashBoardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var subSectionImageView: UIImageView!
    @IBOutlet weak var subSectionHeaderLabel: UILabel!
    @IBOutlet weak var subSectionValueLabel: UILabel!
    @IBOutlet weak var subSectionHeaderView: UIView!
    @IBOutlet weak var subSectionShortName: UILabel!
    @IBOutlet weak var circularValueView: UIView!
    @IBOutlet weak var circularValueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        circularValueView.circle()
        // Initialization code
    }
    
    func setSubSectionData(data : DashBoardSubSection?, isComingFrom : NavigationFlow) {
        if isComingFrom == .Inbox {
            self.subSectionHeaderView.backgroundColor = UIColor.darkBlackBlue
            self.subSectionImageView.isHidden = true
            self.subSectionValueLabel.isHidden = true
        }
        if isComingFrom == .HomeDashBoard {
            self.subSectionShortName.isHidden = true
            self.circularValueView.isHidden = true
        }
       setData(data: data)
    }
    
    func setData(data: DashBoardSubSection?) {
       // self.subSectionImageView.setImage(named: data?.imageName)
        self.subSectionHeaderLabel.text = data?.headerName
        self.subSectionValueLabel.text = String(data?.value ?? 0)
        self.circularValueLabel.text = String(data?.value ?? 0)
        self.subSectionShortName.text = data?.shortName
        self.backgroundColor = UIColor.getColorByCode(code: data?.backgroundColor ?? 0)
    }
}
