//
//  UIViewController.swift
//  Part On Demand
//
//  Created by TungHN on 2/24/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /*
    func gotoLogin() {
        let loginVC = navigationController!.viewControllers.filter { $0 is LoginViewController }.first!
        navigationController!.popToViewController(loginVC, animated: true)
    }
 */
    
    func showError(error: String) {
        let alert = UIAlertController(title: "Lỗi", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Đồng ý", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showSuccess(message: String) {
        let alert = UIAlertController(title: NSLocalizedString("success", comment: ""), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] (_) in
            self?.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
}
