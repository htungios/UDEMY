//
//  SVProgressHUD+Extention.swift
//
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import SVProgressHUD

extension SVProgressHUD {
    
    public static func showDismissableError(with status: String) {
        let nc = NotificationCenter.default
        nc.addObserver(
            self, selector: #selector(hudTapped(_:)),
            name: NSNotification.Name.SVProgressHUDDidReceiveTouchEvent,
            object: nil
        )
        nc.addObserver(
            self, selector: #selector(hudDisappeared(_:)),
            name: NSNotification.Name.SVProgressHUDWillDisappear,
            object: nil
        )
        SVProgressHUD.showError(withStatus: status)
        SVProgressHUD.setDefaultMaskType(.clear)
    }
    
    @objc
    private static func hudTapped(_ notification: Notification) {
        SVProgressHUD.dismiss()
        SVProgressHUD.setDefaultMaskType(.none)
    }
    
    @objc
    private static func hudDisappeared(_ notification: Notification) {
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: NSNotification.Name.SVProgressHUDDidReceiveTouchEvent, object: nil)
        nc.removeObserver(self, name: NSNotification.Name.SVProgressHUDWillDisappear, object: nil)
        SVProgressHUD.setDefaultMaskType(.none)
    }
    
}
