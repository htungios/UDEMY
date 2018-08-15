//
//  NSError.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import Foundation

extension NSError {
    
    static func error(with localizedDescription: String) -> NSError {
        let userInfo = [NSLocalizedDescriptionKey: localizedDescription]
        
        let error = NSError(domain: Bundle.main.bundleIdentifier!,
                            code: 0,
                            userInfo: userInfo)
        
        return error
    }
    
}
