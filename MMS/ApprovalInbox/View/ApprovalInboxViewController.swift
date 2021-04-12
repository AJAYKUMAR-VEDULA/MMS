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
    @IBOutlet weak var searchView: UIView!
    @IBOutlet var searchDeatilBackgroungView: UIView!
    @IBOutlet weak var searchDeatilsView: UIView!
    @IBOutlet weak var searchByWorkLabel: UILabel!
    @IBOutlet weak var searchByNameLabel: UILabel!
    @IBOutlet weak var dateFromLabel: UILabel!
    @IBOutlet weak var dateToLabel: UILabel!
    @IBOutlet weak var seachButtonView: UIView!
    @IBOutlet weak var closeImageView: UIImageView!
    @IBOutlet weak var searchButtonView: UIView!
    var approvalInboxDetails : ApprovalInboxSectionModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        configureView()
        approvalInboxDetails = JsonHelper().getDataFromJson(jsonResourceName: AppConstants.approvalInboxDetails, data: ApprovalInboxSectionModel.self)
        self.title = "Approval Inbox"
        // Do any additional setup after loading the view.
    }
    
    func configureView() {
        searchDeatilBackgroungView.isHidden = true
        searchDeatilsView.isHidden = true
        searchView.circle()
        approvalInboxSelectionView.backgroundColor = UIColor.rgb(r: 250, g: 250, b: 250)
        inboxTableView.backgroundColor =  UIColor.lowGrey
        searchView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOfSearch)))
        closeImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOfClose)))
        searchButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOfClose)))
        searchByWorkLabel.roundedBorder(5, UIColor.black.cgColor, 1)
        searchByNameLabel.roundedBorder(5, UIColor.black.cgColor, 1)
        dateFromLabel.roundedBorder(5, UIColor.black.cgColor, 1)
        dateToLabel.roundedBorder(5, UIColor.black.cgColor, 1)
        seachButtonView.roundedBorder(borderColor: UIColor.white.cgColor, borderWidth: 0)
    }
    
    func registerCells() {
        self.inboxTableView.registerNibs(nibName: AppConstants.approvalInboxTableViewCell, cellReuseIdentifier: AppConstants.approvalInboxTableViewCellIdentifier)
    }
    
    @objc func tapOfSearch() {
        searchDeatilBackgroungView.isHidden = false
        searchDeatilsView.isHidden = false
    }
    
    @objc func tapOfClose() {
        searchDeatilBackgroungView.isHidden = true
        searchDeatilsView.isHidden = true
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
