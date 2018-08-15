//
//  UIBarButtonItem.swift
//
//  Copyright © 2018 OPS PH. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(style: UIBarButtonItemStyle, font: UIFont, title: String? = nil, target: Any? = nil, action: Selector? = nil) {
        self.init(title: title, style: style, target: target, action: action)
        setTitleTextAttributes([NSAttributedStringKey.font: font], for: .normal)
    }
    
}
