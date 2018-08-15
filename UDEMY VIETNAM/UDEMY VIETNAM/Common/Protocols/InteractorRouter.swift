//
//  InteractorRouter.swift
//  Part On Demand
//
//  Created by TungHN on 2/24/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

protocol InteractorRouter {
    func gotoLoginScreen(view: UIViewController)
    func showError(view: UIViewController, error: String)
    func showSuccess(view: UIViewController, message: String)
    func dismiss(view: UIViewController)
    func popViewController(view: UIViewController)
}

extension InteractorRouter {
    
    func gotoLoginScreen(view: UIViewController) {}
    func showError(view: UIViewController, error: String) {}
    func showSuccess(view: UIViewController, message: String) {}
    func dismiss(view: UIViewController) {}
    func popViewController(view: UIViewController) {}
    
}
