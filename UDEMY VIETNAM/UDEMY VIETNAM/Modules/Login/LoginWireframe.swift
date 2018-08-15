//  
//  LoginWireframe.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/3/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class LoginWireframe {
    
    let viewController: UIViewController
    
    init() {
        
        let view = Constant.MAIN_SB.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        
        viewController = view
        
        view.output = interactor
        interactor.output = presenter
        interactor.router = self
        presenter.output = view
        
    }
    
}

extension LoginWireframe: LoginInteractorRouter {
    
    func loginSuccess() {
        /*
        let vc = CoursesWireframe().viewController
        let navC = UINavigationController(rootViewController: vc)
        viewController.present(navC, animated: true, completion: nil)
 */
        
        let coursesViewController = CoursesWireframe().viewController as? CoursesViewController
        let menuViewController = LeftMenuWireframe().viewController as? LeftMenuViewController
        let nvc: UINavigationController = UINavigationController(rootViewController: coursesViewController!)
        menuViewController?.coursesViewController = nvc
        let slideMenuController = SlideMenuViewController(mainViewController: nvc, leftMenuViewController: menuViewController!)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = coursesViewController
        
        viewController.present(slideMenuController, animated: true, completion: nil)
    }
    
    func showError(view: UIViewController, error: String) {
        view.showError(error: error)
    }

}
