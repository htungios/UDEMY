//  
//  LeftMenuWireframe.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 8/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class LeftMenuWireframe {
    
    let viewController: UIViewController
    
    init() {
        
        let view = Constant.MAIN_SB.instantiateViewController(withIdentifier: "LeftMenuViewController") as! LeftMenuViewController
        let interactor = LeftMenuInteractor()
        let presenter = LeftMenuPresenter()
        
        viewController = view
        
        view.output = interactor
        interactor.output = presenter
        interactor.router = self
        presenter.output = view
        
    }
    
}

extension LeftMenuWireframe: LeftMenuInteractorRouter {

    func showError(view: UIViewController, error: String) {
        view.showError(error: error)
    }
    
}
