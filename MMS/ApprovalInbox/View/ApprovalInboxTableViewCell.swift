//
//  ApprovalInboxTableViewCell.swift
//  MMS
//
//  Created by AJ on 29/03/21.
//

import UIKit

class ApprovalInboxTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellBackGroundView: UIView!
    @IBOutlet weak var approalInboxImageView: UIImageView!
    @IBOutlet weak var createdDataLabel: UILabel!
    @IBOutlet weak var createdByLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var workOrderNumberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureView() {
        cellView.backgroundColor = UIColor.lowGrey
        cellBackGroundView.backgroundColor = UIColor.rgb(r: 255, g: 255, b: 255)
        statusLabel.textColor = UIColor.paleRed
        cellBackGroundView.shadow(color: UIColor.shadowGrey, opacity: 1, offset: .zero, radius: 3)
        approalInboxImageView.circle()
    }
    
    func setApprovalInboxData(data: ApprovalInboxModel) {
        approalInboxImageView.backgroundColor = UIColor.rgb(r: 17, g: 158, b: 193)
        createdDataLabel.text = data.createdDate
        createdByLabel.text = "Created By: \(data.createdBy)"
        workOrderNumberLabel.text = "Work Order No\(data.orderNumber)"
        let status = ApprovalInboxViewModel().getStatusString(status: data.status)
        statusLabel.text = "Status: \(status)"
    }
}
