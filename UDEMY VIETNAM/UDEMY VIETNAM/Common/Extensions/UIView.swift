//
//  UIView.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

extension UIView {

    var height: CGFloat {
        return frame.height
    }
    
    var width: CGFloat {
        return frame.width
    }

//    func show() {
//        isHidden = false
//    }
//    
//    func hide() {
//        isHidden = true
//    }

    func addConstraints(withFormat format: String, views: UIView...) {
        
        var viewDictionary = [String : UIView]()
        
        for (index, view) in views.enumerated() {
            
            viewDictionary["v\(index)"] = view
            view.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
        
    }
    
    func setCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func setBorder(borderColor: CGColor?, borderWidth: CGFloat) {
        layer.borderColor = borderColor
        layer.borderWidth = borderWidth
    }
    
    func centerAnchor(constraintTo view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func sizeAnchor(constraintTo view: UIView, multiplier: CGFloat = 1.0) {
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
    }
    
    func setRoundedView(size:CGSize, corners: UIRectCorner){
        let maskPAth1 = UIBezierPath(roundedRect: self.bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: size)
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = self.bounds
        maskLayer1.path = maskPAth1.cgPath
        self.layer.mask = maskLayer1
        
    }
    
    // MARK: - Static Methods
    static func lineView(backgroundColor: UIColor = .gray, edgeInsets: UIEdgeInsets = UIEdgeInsets.zero, height: CGFloat) -> UIView {
        let line = lineView(backgroundColor: backgroundColor, edgeInsets: edgeInsets)
        line.heightAnchor.constraint(equalToConstant: height).isActive = true
        return line
    }
    
    static func lineView(backgroundColor: UIColor = .gray, edgeInsets: UIEdgeInsets = UIEdgeInsets.zero) -> UIView {
        
        let lineView = UIView()
        
        let line = UIView()
        line.backgroundColor = backgroundColor
        lineView.addSubview(line)
        
        guard edgeInsets != UIEdgeInsets.zero else {
            lineView.backgroundColor = backgroundColor
            return lineView
        }
        
        let paddingString = { (paddingValue: CGFloat) -> String in
            return paddingValue > 0 ? "-\(paddingValue)-" : ""
        }
        
        let leftPadding = paddingString(edgeInsets.left)
        let rightPadding = paddingString(edgeInsets.right)
        let topPadding = paddingString(edgeInsets.top)
        let bottomPadding = paddingString(edgeInsets.bottom)
        
        lineView.addConstraints(withFormat: "H:|\(leftPadding)[v0]\(rightPadding)|", views: line)
        lineView.addConstraints(withFormat: "V:|\(topPadding)[v0]\(bottomPadding)|", views: line)
        
        return lineView
    }
    
}
