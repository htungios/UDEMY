//
//  ShareData.swift
//  Part On Demand
//
//  Created by TungHN on 2/24/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import ObjectMapper

class ShareData: NSObject {
    static let shareInstance = ShareData()
}

extension ShareData {
    
    open func imageWithImage(sourceImage: UIImage, scaledToWidth: CGFloat) -> UIImage {
        if sourceImage.size.width < scaledToWidth {
            return sourceImage
        }
        
        let oldWidth = sourceImage.size.width
        let scaleFactor = scaledToWidth / oldWidth
        
        let newHeight = sourceImage.size.height * scaleFactor
        let newWidth = oldWidth * scaleFactor
        
        UIGraphicsBeginImageContext(CGSize(width:newWidth, height:newHeight))
        sourceImage.draw(in: CGRect(x:0, y:0, width:newWidth, height:newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    
    open static func isValidPhone(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let phoneRegEx = "^(\\+)[0-9]{6,14}$"
        
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: testStr)
    }
    
    open static func updatePhoneFormat(textField: UITextField) {
        
        var str: NSMutableString = textField.text as! NSMutableString
        str.insert("-", at: 3)
        str.insert("-", at: 7)
        textField.text = str as String
    }
    
}

struct AppUtility {
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        
        self.lockOrientation(orientation)
        
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
    
}
