//  
//  CoursesWireframe.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/30/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class CoursesWireframe {
    
    let viewController: UIViewController
    
    init() {
        
        let view = Constant.MAIN_SB.instantiateViewController(withIdentifier: "CoursesViewController") as! CoursesViewController
        let interactor = CoursesInteractor()
        let presenter = CoursesPresenter()
        
        viewController = view
        
        view.output = interactor
        interactor.output = presenter
        interactor.router = self
        presenter.output = view
        
    }
    
}

extension CoursesWireframe: CoursesInteractorRouter {

    func showError(view: UIViewController, error: String) {
        view.showError(error: error)
    }
    
    func didSelectCourse(course: CourseViewModel) {
        let vc = VideoListWireframe(course: course).viewController
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
}
