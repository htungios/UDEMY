//
//  BaseTableHeaderFooterView.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

class BaseTableHeaderFooterView: UITableViewHeaderFooterView, ReuseIdentifiable {

    // MARK: - Object Life Cycle
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHeader()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeader() {
        
    }

}
