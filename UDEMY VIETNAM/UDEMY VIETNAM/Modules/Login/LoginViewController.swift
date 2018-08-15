//  
//  LoginViewController.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/3/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

protocol LoginViewOutput {
    func loginFrom(view: UIViewController, _ email: String?,_ password: String?)
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var separateEmailView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var separatepasswordView: UIView!

    var output: LoginViewOutput?
    fileprivate var _email: String? = ""
    fileprivate var _password: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let prefs = GlobalContext.get(key: GlobalContext.PREFS)
        let user = prefs?.getUser()
        
        if let user = user {
            emailTextField.text = user.email
            passwordTextField.text = user.password
        }
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppUtility.lockOrientation(.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        AppUtility.lockOrientation(.all)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        view.endEditing(false)
        
        _email = emailTextField.text?.trim()
        _password = passwordTextField.text?.trim()

        output?.loginFrom(view: self, _email, _password)
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            separateEmailView.backgroundColor = .green
            separatepasswordView.backgroundColor = .black
        } else {
            separateEmailView.backgroundColor = .black
            separatepasswordView.backgroundColor = .green
        }
        
        textField.tintColor = .green
        
        return true
    }
    
}

extension LoginViewController: LoginPresenterOutput {

}
