//
//  BaseUIScrollView.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

class BaseUIScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
    }

}
