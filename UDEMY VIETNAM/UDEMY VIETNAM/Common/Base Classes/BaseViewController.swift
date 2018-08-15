//
//  BaseViewController.swift
//  Part On Demand
//
//  Created by TungHN on 2/11/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import Then
import SVProgressHUD
import AVFoundation

class BaseViewController: UIViewController {
    
    @IBOutlet weak var titleNavigationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        
    }
        
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func showUserProfileAction(_ sender: UIButton) {
//        let vc = UserInfomationWireframe().viewController
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//
//    @IBAction func closeUserProfileAction(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
//    }
    
//    @IBAction func flashlightAction(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
//        toggleTorch(on: sender.isSelected)
//    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
}
