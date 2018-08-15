//
//  PODCommonButton.swift
//  Part On Demand
//
//  Created by Thuan on 3/8/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation


class PODCommonButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.white, for: .selected)
        self.titleLabel?.font = UIFont.sourceAvenirMedium(withSize: 18)
        self.setCornerRadius(with: frame.size.height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
