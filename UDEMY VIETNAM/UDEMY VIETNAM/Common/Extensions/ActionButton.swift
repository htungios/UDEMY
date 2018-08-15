//
//  ActionButton.swift
//  Part On Demand
//
//  Created by TungHN on 2/11/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ActionButton: UIButton {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.setTitleColor(.white, for: .normal)
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
