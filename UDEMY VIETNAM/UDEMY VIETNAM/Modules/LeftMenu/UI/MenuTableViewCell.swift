//
//  MenuTableViewCell.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 8/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class MenuTableViewCell: BaseTableViewCell {

    let menuImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    let separator: UIView = {
        let view = UIView.lineView(height: 1)
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(horizontalViews: [menuImage, titleLabel])
        stack.spacing = 20
        return stack
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(stackView)
        addSubview(separator)
        
        addConstraints(withFormat: "H:|-10-[v0]-10-|", views: stackView)
        addConstraints(withFormat: "V:|-15-[v0]-15-|", views: stackView)
        addConstraints(withFormat: "H:|-10-[v0]-10-|", views: separator)
        addConstraints(withFormat: "V:[v0]|", views: separator)
        menuImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
}
