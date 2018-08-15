//
//  LessonCourseTableViewCell.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/31/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class LessonCourseTableViewCell: BaseTableViewCell {

    let checkImage: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "ic_status_yes")
        view.contentMode = .scaleAspectFit
        view.widthAnchor.constraint(equalToConstant: 32).isActive = true
        view.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(checkImage)
        addSubview(titleLabel)
        
        addConstraints(withFormat: "H:|-10-[v0]-15-[v1]-10-|", views: checkImage, titleLabel)
        addConstraints(withFormat: "V:|-15-[v0]", views: checkImage)
        addConstraints(withFormat: "V:|-15-[v0]-15-|", views: titleLabel)
    }
    
    func config(video: VideoListViewModel) {
        checkImage.isHidden = !video.status
        titleLabel.text = video.tenBai
    }
    
}
