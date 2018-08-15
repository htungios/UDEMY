//
//  UIStackview.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

extension UIStackView {

    class func horizontalFormView(withLabel labelView: UIView, textView: UIView) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [labelView, textView])
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }
    
    class func verticalView() -> UIStackView {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }

    convenience init(horizontalViews views: [UIView]) {
        self.init(arrangedSubviews: views)
        self.axis = .horizontal
    }

    convenience init(verticalViews views: [UIView]) {
        self.init(arrangedSubviews: views)
        self.axis = .vertical
    }

}
