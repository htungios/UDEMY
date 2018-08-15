//
//  RouterOutputProtocol.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

protocol RouterOutputProtocol {
    func showErrorDialog(fromViewController: UIViewController, message: String)
    func showDefaultErrorDialog(fromViewController: UIViewController, title: String, message: String)
    func showDeleteDialog(fromViewController: UIViewController,
                                   title: String,
                                   message: String,
                                   cancelButton: String,
                                   confirmButton: String,
                                   completion: @escaping (_ bool: Bool) -> Void)
}

extension RouterOutputProtocol {
    
    func showErrorDialog(fromViewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        fromViewController.present(alert, animated: true, completion: nil)
    }
    
    func showDefaultErrorDialog(fromViewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        fromViewController.present(alert, animated: true, completion: nil)
    }

    func showDeleteDialog(fromViewController: UIViewController,
                                   title: String,
                                   message: String,
                                   cancelButton: String,
                                   confirmButton: String,
                                   completion: @escaping (_ bool: Bool) -> Void){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let cancelButton = UIAlertAction(title: cancelButton,
                                         style: .cancel,
                                         handler: {  (alert: UIAlertAction!) in
                                            completion(false)
                                        })

        let actionButton = UIAlertAction(title: confirmButton,
                                         style: .destructive,
                                         handler: {(alert: UIAlertAction!) in
                                            completion(true)
                                        })

        alert.addAction(cancelButton)
        alert.addAction(actionButton)

        fromViewController.present(alert, animated: true, completion: nil)

    }

}
