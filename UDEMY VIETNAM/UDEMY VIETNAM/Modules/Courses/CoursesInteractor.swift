//  
//  CoursesInteractor.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/30/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

protocol CoursesInteractorOutput {
    func showCourses(json: JSON)
}

protocol CoursesInteractorRouter: InteractorRouter {
    func didSelectCourse(course: CourseViewModel)
}

class CoursesInteractor {

    var output: CoursesInteractorOutput?
    var router: CoursesInteractorRouter?

}

extension CoursesInteractor: CoursesViewOutput {

    func viewDidLoad(view: UIViewController) {
        guard let prefs = GlobalContext.get(key: GlobalContext.PREFS) else { return }
        let user = prefs.getUser()
        UserProfileService.share.courses(idUser: user.id, success: { [weak self] (json) in
            self?.output?.showCourses(json: json)
        }) { [weak self] (response) in
            let error = DefaultRequestFailureHandler(response)
            self?.router?.showError(view: view, error: error)
        }
    }
    
    func didSelectCourse(course: CourseViewModel) {
        router?.didSelectCourse(course: course)
    }
    
}
