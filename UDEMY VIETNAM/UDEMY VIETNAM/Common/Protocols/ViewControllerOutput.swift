//
//  ViewControllerOutput.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import UIKit

protocol ViewControllerOutput {
    func viewDidLoad(view: UIViewController)
    func viewWillAppear(view: UIViewController)
    func viewWillDisappear(view: UIViewController)
}

extension ViewControllerOutput {
    
    func viewDidLoad(view: UIViewController) {}
    func viewWillAppear(view: UIViewController) {}
    func viewWillDisappear(view: UIViewController) {}
    
}
