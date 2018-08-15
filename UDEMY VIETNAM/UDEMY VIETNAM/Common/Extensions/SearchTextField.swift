//
//  SearchTextField.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

class SearchTextField: UIView {

    fileprivate var _customPlaceholderAttributes: [NSAttributedStringKey : Any] = [:]

    fileprivate let _rightImageOverlay: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "blue_add_icon"))
        image.frame = CGRect(x: 0,
                             y: 0,
                             width: (image.image?.size.width)!,
                             height: (image.image?.size.height)!)
        image.contentMode = .center
        return image
    }()

    var rightImageOverlayWidth: CGFloat = CGFloat(0) {
        didSet {
            let width = _rightImageOverlay.image?.size.width
            _rightImageOverlay.frame = CGRect(x: frame.origin.x,
                                              y: frame.origin.y,
                                              width: width! + rightImageOverlayWidth,
                                              height: frame.height)
        }
    }

    var isDisplayRightViewOverlay: Bool = false {
        didSet {
            if isDisplayRightViewOverlay {
                placeholderAttributes = [NSAttributedStringKey.foregroundColor: UIColor(red: 154/255, green: 154/255, blue: 154/255, alpha: 1)]
                textField.allowsEditingTextAttributes = false
                textField.rightView = _rightImageOverlay
                textField.rightViewMode = .always
                textField.setCornerRadius(radius: 5)
                setAttributedPlaceholder()
            }
        }
    }

    let textField: TextField = {
        let textField = TextField()
        textField.translatesAutoresizingMaskIntoConstraints = true
        return textField
    }()

    var text: String = "" {
        didSet {
            textField.text = text
        }
    }

    var font: UIFont = UIFont.sourceAvenirBook(withSize: 15) {
        didSet {
            textField.font = font
        }
    }

    var textAlignment: NSTextAlignment = NSTextAlignment.left {
        didSet {
            textField.textAlignment = textAlignment
        }
    }

    var textFieldBackgroundColor: UIColor? = UIColor.clear {
        didSet {
            textField.backgroundColor = textFieldBackgroundColor
        }
    }
    
    var textFieldAlpha: CGFloat = CGFloat(1) {
        didSet {
            textField.alpha = textFieldAlpha
        }
    }

    var paddingRight: CGFloat = CGFloat(0) {
        didSet {
            textField.paddingRight = paddingRight
        }
    }
    
    var paddingLeft: CGFloat = CGFloat(0) {
        didSet {
            textField.paddingLeft = paddingLeft
        }
    }
    
    var paddingTop: CGFloat = CGFloat(0) {
        didSet {
            textField.paddingTop = paddingTop
        }
    }
    
    var paddingBottom: CGFloat = CGFloat(0) {
        didSet {
            textField.paddingBottom = paddingBottom
        }
    }
    
    var placeholder: String = "Search" {
        didSet {
            textField.placeholder = placeholder
            setAttributedPlaceholder()
        }
    }
    
    var placeholderAttributes: [NSAttributedStringKey : Any] = [:] {
        didSet {
            
            for (key, value) in placeholderAttributes {
                _customPlaceholderAttributes[key] = value
            }
            
            setAttributedPlaceholder()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        backgroundColor = .clear
        addSubview(textField)
        addConstraints(withFormat: "H:|[v0]|", views: textField)
        addConstraints(withFormat: "V:|[v0]|", views: textField)
    }

    func textFieldSetBorder(borderColor: CGColor?, borderWidth: CGFloat) {
        textField.setBorder(borderColor: borderColor, borderWidth: borderWidth)
    }

    func textFieldSetCornerRadius(radius: CGFloat) {
        textField.setCornerRadius(radius: radius)
    }

    func textFieldValue() -> String {
        guard let inputString = textField.text,
            !inputString.isEmpty else {
                return ""
        }

        return inputString.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    fileprivate func setAttributedPlaceholder() {
        textField.attributedPlaceholder = NSMutableAttributedString(string: placeholder,
                                                                     attributes: _customPlaceholderAttributes)
    }
    
    static var whiteTextField: SearchTextField {
        let searchField: SearchTextField = {
            let textField = SearchTextField()
            textField.backgroundColor = .white
            textField.textFieldSetBorder(borderColor: UIColor.white.cgColor, borderWidth: 1)
            textField.font = UIFont.sourceAvenirBook(withSize: 15)
            textField.textFieldSetCornerRadius(radius: 5)
            textField.isDisplayRightViewOverlay = true
            textField.placeholder = NSLocalizedString("add_model", comment: "")
            textField.rightImageOverlayWidth = 30
            textField.paddingRight = 10
            textField.paddingLeft = 10
            textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
            return textField
        }()
        
        return searchField
    }

}
