//
//  CALayer.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

extension CALayer {
    
    func createImage() -> UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        
        UIGraphicsEndImageContext()
        
        return image
        
    }
    
}
