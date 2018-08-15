//
//  SessionCourseTableViewCell.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/31/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class SessionCourseTableViewCell: BaseTableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "2196F3")
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(titleLabel)
        
        addConstraints(withFormat: "H:|-10-[v0]-10-|", views: titleLabel)
        addConstraints(withFormat: "V:|-15-[v0]-15-|", views: titleLabel)
    }
    
    func config(video: VideoListViewModel) {
        titleLabel.text = video.session_name
    }

}
