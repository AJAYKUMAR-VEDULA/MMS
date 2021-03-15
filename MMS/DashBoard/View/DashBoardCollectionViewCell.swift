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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setSubSectionData(data : DashBoardSubSection?) {
       // self.subSectionImageView.setImage(named: data.imageName)
        self.subSectionHeaderLabel.text = data?.headerName
        self.subSectionValueLabel.text = String(data?.value ?? 0)
        self.backgroundColor = UIColor.getColorByCode(code: data?.backgroundColor ?? 0)
    }
}
