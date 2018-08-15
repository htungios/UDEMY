//
//  BaseTableViewCell.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell, ReuseIdentifiable {

    // MARK: - Object Life Cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
}
