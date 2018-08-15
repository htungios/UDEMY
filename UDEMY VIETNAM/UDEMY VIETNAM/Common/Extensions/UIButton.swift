//
//  UIButton.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setBackgroundColor(color: UIColor, for state: UIControlState) {
        
        let size = CGSize(width: 1, height: 1)
        let fillRect = CGRect(origin: .zero, size: size)
        
        UIGraphicsBeginImageContext(size)
        color.setFill()
        
        let context = UIGraphicsGetCurrentContext()
        context?.fill(fillRect)
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        setBackgroundImage(colorImage, for: state)
        
    }
    
    func setRoundedButton(size:CGSize, corners: UIRectCorner) {

        let maskPAth1 = UIBezierPath(roundedRect: self.bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: size)
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = self.bounds
        maskLayer1.path = maskPAth1.cgPath
        self.layer.mask = maskLayer1

    }
    
    func setCornerRadius(with height: CGFloat) {
        self.setCornerRadius(radius: height/2)
    }
    
}
