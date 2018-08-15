//
//  BaseCollectionReusableView.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

class BaseCollectionReusableView: UICollectionReusableView, ReuseIdentifiable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}
