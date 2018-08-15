//
//  UINavigationController.swift
//
//  Copyright © 2018 OPS PH. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    var topIndex: Int {
        return viewControllers.count - 1
    }
    
    func replaceTopVc(with viewController: UIViewController) {
        viewControllers[topIndex] = viewController
    }
    
}
