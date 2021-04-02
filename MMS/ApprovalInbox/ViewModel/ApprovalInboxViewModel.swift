//
//  ApprovalInboxViewModel.swift
//  MMS
//
//  Created by AJ on 03/04/21.
//

import Foundation

class ApprovalInboxViewModel {
    
    func getStatusString(status: Int) -> String {
        var statusString = ""
        switch status {
        case statusMapping.Approved.rawValue:
            statusString = "Approved"
        case statusMapping.Modify.rawValue:
            statusString =  "Modify"
        case statusMapping.ModifyAndApprove.rawValue:
            statusString = "Modify And Approve"
        case statusMapping.Rejected.rawValue:
            statusString = "Rejected"
        default:
            statusString = ""
        }
        return statusString.uppercased()
    }
}
