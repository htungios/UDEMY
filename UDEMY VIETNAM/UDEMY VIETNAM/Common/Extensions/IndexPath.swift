//
//  IndexPath.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

extension IndexPath {
    
    func isFirstRow() -> Bool {
        return row == 0
    }
    
    func isLastRow(in tableView: UITableView) -> Bool {
        let totalRows = tableView.numberOfRows(inSection: section)
        return row == (totalRows - 1)
    }
    
}
