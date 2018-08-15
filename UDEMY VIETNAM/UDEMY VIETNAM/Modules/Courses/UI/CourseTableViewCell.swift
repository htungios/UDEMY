//
//  CourseTableViewCell.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/30/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import SDWebImage

class CourseTableViewCell: BaseTableViewCell {
    
    let courseImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let courseTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let courseDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "9A9A9A")
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(courseImageView)
        addSubview(courseTitleLabel)
        addSubview(courseDetailLabel)
        
        addConstraints(withFormat: "H:|-5-[v0]-5-|", views: courseImageView)
        addConstraints(withFormat: "H:|-15-[v0]-15-|", views: courseTitleLabel)
        addConstraints(withFormat: "H:|-15-[v0]-15-|", views: courseDetailLabel)
        addConstraints(withFormat: "V:|-10-[v0]-15-[v1]-5-[v2]-15-|", views: courseImageView, courseTitleLabel, courseDetailLabel)
        courseImageView.heightAnchor.constraint(equalTo: courseImageView.widthAnchor, multiplier: 0.55  ).isActive = true
    }
    
    func config(course: CourseViewModel) {
        let urlImage = URL(string: course.courseImage)
        courseImageView.sd_setImage(with: urlImage, placeholderImage: nil)
        courseTitleLabel.text = course.courseName
        courseDetailLabel.text = "Giảng viên: " + course.courseTeacher
    }

}
