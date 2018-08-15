//
//  UIImage.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

extension UIImage {
    
    static let imageCache = NSCache<NSURL, UIImage>()
    
    class func createThumbImage(size: CGFloat, color: UIColor) -> UIImage {
        let layerFrame = CGRect(x: 0, y: 0, width: size, height: size)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = CGPath(ellipseIn: layerFrame.insetBy(dx: 1, dy: 1), transform: nil)
        shapeLayer.fillColor = color.cgColor
        shapeLayer.strokeColor = color.withAlphaComponent(0.65).cgColor

        let layer = CALayer.init()
        layer.frame = layerFrame
        layer.addSublayer(shapeLayer)

        return self.imageFromLayer(layer: layer)
    }

    class func imageFromLayer(layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, UIScreen.main.scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)

        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return outputImage!
    }
    
    class func parseImage(fromUrl url: URL, completion: @escaping (UIImage?) -> Void) {
        
        if let cachedImage = imageCache.object(forKey: url as NSURL) {
            completion(cachedImage)
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                
                let imageData = try Data(contentsOf: url)
                let image = UIImage(data: imageData)
                
                if let img = image {
                    imageCache.setObject(img, forKey: url as NSURL)
                }
                
                DispatchQueue.main.async {
                    completion(image)
                }
                
            } catch let error {
                DispatchQueue.main.async {
                    completion(nil)
                    print("Error loading image: \(error)")
                }
                
            }
        }
        
    }
}
