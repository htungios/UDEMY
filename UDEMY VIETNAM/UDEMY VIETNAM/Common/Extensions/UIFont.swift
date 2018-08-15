//
//  UIFont.swift
//  Example
//
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import UIKit

let sourceAvenirFontName = "Avenir"
let manifoldCFFontName = "ManifoldCF"

enum FontType: String {
    case Semibold = "Semibold"
    case Regular = "Regular"
    case Bold = "Bold"
    case Light = "Light"
    case Black = "Black"
    case Book = "Book"
    case Medium = "Medium"
}

extension UIFont {

    static var scale: CGFloat {
        return preferredFont(forTextStyle: .body).pointSize / 15.5
    }
    
    static var navigationBarTitleFont: UIFont {
        return font(forName: manifoldCFFontName, type: .Regular, size: 16)
    }
    
    class func sourceAvenirBlack(withSize size: CGFloat) -> UIFont {
        return font(forName: sourceAvenirFontName, type: .Black, size: size)
    }
    
    class func sourceAvenirSemibold(withSize size: CGFloat) -> UIFont {
        return font(forName: sourceAvenirFontName, type: .Semibold, size: size)
    }
    
    class func sourceAvenirBold(withSize size: CGFloat) -> UIFont {
        return font(forName: sourceAvenirFontName, type: .Bold, size: size)
    }
    
    class func sourceAvenirLight(withSize size: CGFloat) -> UIFont {
        return font(forName: sourceAvenirFontName, type: .Light, size: size)
    }
    
    class func sourceAvenirRegular(withSize size: CGFloat) -> UIFont {
        return font(forName: sourceAvenirFontName, type: .Regular, size: size)
    }
    
    class func sourceAvenirBook(withSize size: CGFloat) -> UIFont {
        return font(forName: sourceAvenirFontName, type: .Book, size: size)
    }
    
    class func sourceAvenirMedium(withSize size: CGFloat) -> UIFont {
        return font(forName: sourceAvenirFontName, type: .Medium, size: size)
    }
    
    class func font(forName name: String, type: FontType, size: CGFloat) -> UIFont {
        let name = "\(name)-\(type.rawValue)"
        let font = UIFont(name: name, size: size)!
        return font.withSize(font.pointSize)
    }

}
