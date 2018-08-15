//
//  BaseUIView.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

class BaseUIView: UIView {

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
