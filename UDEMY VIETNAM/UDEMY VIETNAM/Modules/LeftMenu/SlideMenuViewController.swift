//
//  SlideMenuViewController.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 8/11/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class SlideMenuViewController: SlideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.changeLeftViewWidth(UIScreen.main.bounds.size.width * 0.85)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
