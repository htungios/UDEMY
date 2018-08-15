//  
//  LoginInteractor.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/3/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import ObjectMapper

protocol LoginInteractorOutput {

}

protocol LoginInteractorRouter: InteractorRouter {
    func loginSuccess()
}

class LoginInteractor {

    var output: LoginInteractorOutput?
    var router: LoginInteractorRouter?

}

extension LoginInteractor: LoginViewOutput {

    func loginFrom(view: UIViewController, _ email: String?, _ password: String?) {
        guard let email = email else {
            return
        }
        
        guard let password = password else {
            return
        }
        
        UserProfileService.share.login(email: email, password: password, success: { [weak self] (json) in
            if let userDict = json.dictionaryObject {
                if let id = userDict["id"] as? Int {
                    if id > 0 {
                        let prefs = GlobalContext.get(key: GlobalContext.PREFS)
                        let user = Mapper<UserModel>().map(JSONObject: userDict)
                        user?.password = password
                        prefs?.updateUserDataJSON(user: user)
                        self?.router?.loginSuccess()
                    } else {
                        self?.router?.showError(view: view, error: "Thông tin đăng nhập không đúng. Vui lòng thử lại.")
                    }
                }
            }
        }) { [weak self] (response) in
            let error = DefaultRequestFailureHandler(response)
            self?.router?.showError(view: view, error: error)
        }
    }
    
}
