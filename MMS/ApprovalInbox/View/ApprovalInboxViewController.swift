//
//  ApprovalInboxViewController.swift
//  MMS
//
//  Created by AJ on 29/03/21.
//

import UIKit

class ApprovalInboxViewController: UIViewController {
    @IBOutlet weak var inboxTableView: UITableView!
    @IBOutlet weak var approvalInboxSelectionView: UIView!
    var approvalInboxDetails : ApprovalInboxSectionModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        configureView()
        approvalInboxDetails = JsonHelper().getDataFromJson(jsonResourceName: AppConstants.approvalInboxDetails, data: ApprovalInboxSectionModel.self)
        // Do any additional setup after loading the view.
    }
    
    func configureView() {
        approvalInboxSelectionView.backgroundColor = UIColor.rgb(r: 250, g: 250, b: 250)
        inboxTableView.backgroundColor =  UIColor.lowGrey
    }
    
    func registerCells() {
        self.inboxTableView.registerNibs(nibName: AppConstants.approvalInboxTableViewCell, cellReuseIdentifier: AppConstants.approvalInboxTableViewCellIdentifier)
    }
}

extension ApprovalInboxViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return approvalInboxDetails?.approvalInboxSection.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let approvalInboxCell = self.inboxTableView.dequeueReusableCell(withIdentifier: AppConstants.approvalInboxTableViewCellIdentifier) as? ApprovalInboxTableViewCell else {
            return UITableViewCell()
        }
        if let approvalInboxSectionDetails = approvalInboxDetails?.approvalInboxSection[indexPath.row] {
            approvalInboxCell.setApprovalInboxData(data: approvalInboxSectionDetails)
        }
        return approvalInboxCell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
