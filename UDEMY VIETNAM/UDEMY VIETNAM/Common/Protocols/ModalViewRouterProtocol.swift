//
//  ModalViewRouterProtocol.swift
//  Chain
//
//  Created by OPS on 4/11/17.
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

protocol ModalViewRouterProtocol: RouterOutputProtocol {
    func dismissView(view: UIViewController)
}

extension ModalViewRouterProtocol {

    func dismissView(view: UIViewController) {
        view.dismiss(animated: true, completion: nil)
    }

}
