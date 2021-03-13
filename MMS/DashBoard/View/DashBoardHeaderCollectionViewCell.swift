//
//  DashBoardHeaderCollectionViewCell.swift
//  MMS
//
//  Created by AJ on 06/03/21.
//

import UIKit

class DashBoardHeaderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var sectionHeaderLabel: UILabel!
    @IBOutlet weak var backgroundViewLayer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setSectionHeaderData(sectionHeader: String) {
        self.sectionHeaderLabel.text = sectionHeader
        self.backgroundViewLayer.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1)
    }

}
