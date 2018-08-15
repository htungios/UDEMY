//  
//  LeftMenuInteractor.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 8/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

protocol LeftMenuInteractorOutput {
    func showImages(json: JSON)
}

protocol LeftMenuInteractorRouter: InteractorRouter {

}

class LeftMenuInteractor {

    var output: LeftMenuInteractorOutput?
    var router: LeftMenuInteractorRouter?

}

extension LeftMenuInteractor: LeftMenuViewOutput {

    func viewDidLoad(view: UIViewController) {
        guard let prefs = GlobalContext.get(key: GlobalContext.PREFS) else { return }
        let user = prefs.getUser()
        
        UserProfileService.share.getMenuImages(idUser: user.id, success: { [weak self] (json) in
            self?.output?.showImages(json: json)
        }) { [weak self] (response) in
            let error = DefaultRequestFailureHandler(response)
            self?.router?.showError(view: view, error: error)
        }
    }
    
    func showPromotion(view: UIViewController) {
        guard let prefs = GlobalContext.get(key: GlobalContext.PREFS) else { return }
        let user = prefs.getUser()
       
        UserProfileService.share.getPromotion(idUser: user.id, success: { [weak self] (response) in
            if let promotionStr = response as? String, promotionStr != "" {
                if let url = URL(string: promotionStr) {
                    UIApplication.shared.openURL(url)
                }
            } else {
                self?.router?.showError(view: view, error: "Hiện tại không có khuyến mại dành cho bạn")
            }
        }) { [weak self] (response) in
            self?.router?.showError(view: view, error: response!)
        }
    }
    
}
