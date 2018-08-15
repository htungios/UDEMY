//  
//  CoursesPresenter.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/30/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import ObjectMapper

protocol CoursesPresenterOutput {
    func showCourses(courses: [CourseViewModel])
}

class CoursesPresenter {

    var output: CoursesPresenterOutput?

}

extension CoursesPresenter: CoursesInteractorOutput {
    
    func showCourses(json: JSON) {
        if let courses = json.arrayObject {
            if let data = Mapper<CourseViewModel>().mapArray(JSONObject: courses) {
                output?.showCourses(courses: data)
            }
        }
    }
    
}
