//
//  CourseViewModel.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/30/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import ObjectMapper

class CourseViewModel: BaseDataModel {
    enum PropertiesKey: String {
        case CourseName
        case CourseImage
        case CourseTeacher
        case Id
    }
    
    // MARK: - Properties
    
    var courseName: String = ""
    var courseImage: String = ""
    var courseTeacher: String = ""
    var id: Int = 0
    
    // MARK: - Mappable
    override func mapping(map: ObjectMapper.Map) {
        super.mapping(map: map)
        
        self.courseName         <- map[PropertiesKey.CourseName.rawValue]
        self.courseImage        <- map[PropertiesKey.CourseImage.rawValue]
        self.courseTeacher      <- map[PropertiesKey.CourseTeacher.rawValue]
        self.id                 <- map[PropertiesKey.Id.rawValue]
    }
    
}
