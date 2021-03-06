//
//  DashBoardModel.swift
//  MMS
//
//  Created by AJ on 13/03/21.
//

import Foundation
import UIKit

struct DashBoardModel: Codable {
    var dashBoardSections : [DashBoardSection]
}

struct DashBoardSection: Codable {
    var sectionHeader : String
    var hasNextlevel : Bool
    var subSections : [DashBoardSubSection]
}

struct DashBoardSubSection: Codable {
    var imageName : String
    var headerName : String
    var shortName : String
    var value : Int
    var backgroundColor : Int
    
    /// when the keys we recieve and we want to use be different.
    enum CodingKeys : String, CodingKey {
        case imageName = "imageName"
        case headerName = "name"
        case shortName = "shortName"
        case value = "value"
        case backgroundColor = "backgroundColor"
    }
}

enum NavigationFlow {
    case HomeDashBoard
    case Inbox
}
