//
//  TextField.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

class TextField: UITextField {

    var paddingRight: CGFloat = 0
    var paddingLeft: CGFloat = 0
    var paddingTop: CGFloat = 0
    var paddingBottom: CGFloat = 0
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {

        let textFieldheight = bounds.size.height + paddingTop + paddingBottom

        return CGRect(x: bounds.origin.x + paddingLeft,
                      y: bounds.origin.y - paddingBottom,
                      width: bounds.size.width - paddingLeft - paddingRight,
                      height: textFieldheight)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    func defaultTextField() {
        self.backgroundColor = .white
        self.font = UIFont.sourceAvenirBook(withSize: 15)
        self.setCornerRadius(radius: 10)
        self.paddingTop = 15
        self.paddingLeft = 20
        self.paddingRight = 28
        self.paddingBottom = 15
    }
    
    func defaultWithRightArrow() {
        defaultTextField()
    }
    
    // override rightViewRectForBounds method:
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rightBounds = CGRect(x: bounds.width - 28, y: bounds.height / 2 - 9, width: 18, height: 18)
        return rightBounds
    }

}
