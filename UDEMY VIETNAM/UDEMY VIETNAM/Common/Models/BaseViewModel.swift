//
//  BaseViewModel.swift
//
//  Copyright © 2018 None. All rights reserved.
//

import Moya

public typealias RequestSuccessClosure = (() -> Void)
public typealias RequestSuccessWithDataClosure = ((JSON) -> Void)
public typealias RequestSuccessWithAnyClosure = ((Any) -> Void)
public typealias RequestFailureClosure = ((String?) -> Void)
public typealias RequestFailureWithDataClosure = ((Response) -> Void)

public struct ResponseKey {
    static let message = "message"
    static let message_upper_case = "Message"
}

public func DefaultRequestFailureHandler(_ errorResponse: Response) -> String {
    // Check statusCode and handle desired errors
    do {
        guard let errorJson = try errorResponse.mapJSON() as? Dictionary<String, Any> else {
            return NSLocalizedString("mss_server_error", comment: "")
        }
        
        var errorStr = ""
        if let message = errorJson[ResponseKey.message_upper_case] as? String {
            errorStr = message
        } else if let message = errorJson[ResponseKey.message] as? String {
            errorStr = message
        }
        
        return errorStr
        
    }
    catch {
        return NSLocalizedString("no_network", comment: "")
    }
    
}

class BaseViewModel {
    
}
