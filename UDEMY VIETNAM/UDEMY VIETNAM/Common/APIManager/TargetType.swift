//
//  TargetType.swift
//
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import Moya
import MoyaSugar

public protocol TargetType: SugarTargetType {
    
}

extension TargetType {
    
    public var baseURL: URL {
        return URL(string: Constant.API_HOST)!
        
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .request
    }
}
