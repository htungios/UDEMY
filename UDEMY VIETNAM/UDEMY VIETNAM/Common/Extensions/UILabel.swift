//
//  UILabel.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

extension UILabel {
    
    func widthThatWouldFit() -> CGFloat {
        numberOfLines = 0
        let str = self.text! as NSString
        let textRect = str.boundingRect(with: CGSize(width: .greatestFiniteMagnitude, height: self.height), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: self.font], context: nil)
        
        return textRect.size.width
    }
    
    func widthToFit() {
        numberOfLines = 0
        let str = self.text! as NSString
        let textRect = str.boundingRect(with: CGSize(width: .greatestFiniteMagnitude, height: self.height), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: self.font], context: nil)
        
        var labelRect = frame
        labelRect.size.width = textRect.size.width
        
        frame = labelRect
    }
}

@IBDesignable class TopAlignedLabel: UILabel {
    override func drawText(in rect: CGRect) {
        if let stringText = text {
            let stringTextAsNSString = stringText as NSString
            let labelStringSize = stringTextAsNSString.boundingRect(with: CGSize(width: self.frame.width,height: CGFloat.greatestFiniteMagnitude),
                                                                    options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                                    attributes: [NSAttributedStringKey.font: font],
                                                                    context: nil).size
            super.drawText(in: CGRect(x:0,y: 0,width: self.frame.width, height:ceil(labelStringSize.height)))
        } else {
            super.drawText(in: rect)
        }
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
}
