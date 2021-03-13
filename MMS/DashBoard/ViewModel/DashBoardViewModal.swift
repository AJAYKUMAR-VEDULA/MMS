//
//  DashBoardViewModal.swift
//  MMS
//
//  Created by AJ on 13/03/21.
//

import Foundation


class DashBoardViewModel {
    
    
    func shouldShowCellWithFullWidth(subsectionsCount: Int, indexPath: Int) -> Bool {
        if ((subsectionsCount) % 2 != 0),indexPath == (subsectionsCount) {
            return true
        }
        return false
    }
    
    func getDashBoardDetails() -> DashBoardModel? {
        return nil
    }
}
