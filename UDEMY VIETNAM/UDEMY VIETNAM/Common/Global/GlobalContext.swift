//
//  GlobalContext.swift
//
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

/**
 A typed key
 Intended type of the content for the key
 */
class TypedKey<T>{
    let name:String
    init(_ name:String)
    {
        self.name = name
    }
}

final class GlobalContext {
    // MARK: - Identify KEY
    static let PREFS = TypedKey<Preferences>("prefs")
    
    
    private static var instances = [String:Any]()
    /// Get instance of typed T
    static func get<T>(key:TypedKey<T>) -> T?{
        return instances[key.name] as? T
    }
    
    /// Set instance of typed T
    static func bind<T>(_ key:TypedKey<T>, _ value:T?){
        instances[key.name] = value
    }
    
    /// Get Boolean value, if not exists, assign false and return it.
    static func getBool(key:TypedKey<Bool>) -> Bool {
        if let b = get(key: key){
            return b
        }
        bind(key, false)
        return false
    }
    // Load Content
    static let appLoadOb:Observable<()> = {
        let block:() -> () = {
            let prefs = Preferences()
            GlobalContext.bind(GlobalContext.PREFS, prefs)
        }
        
        return myJustOnGlobalQueue(closure: block()).observeOn(MainScheduler.instance).shareReplay(1)
    }()
}
