//
//  ApprovalInboxModel.swift
//  MMS
//
//  Created by AJ on 29/03/21.
//

import Foundation


struct ApprovalInboxSectionModel : Codable {
    var approvalInboxSection: [ApprovalInboxModel]
}

struct ApprovalInboxModel : Codable {
    var createdDate: String
    var createdBy: String
    var status: Int
    var orderNumber: String
    var image: String
}


enum statusMapping: Int {
    case Approved = 0
    case Modify
    case ModifyAndApprove
    case Rejected
}
