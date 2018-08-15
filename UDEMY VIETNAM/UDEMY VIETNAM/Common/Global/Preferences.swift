//
//  Preferences.swift
//
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

// MARK: Identify User Default - KEY
// Login
private let GLOBAL_USER_ACCESS_TOKEN = "global.user.access.token"
// User Data Model
private let GLOBAL_USER_DATA = "global.user.data"
// Language
private let GLOBAL_LANGUAGE = "global.language"
// Remember Signin
private let GLOBAL_REMEMBER_SIGNIN = "global.remember.signin"

class Preferences {
    let kvoStore = UserDefaults.standard
    
    // MARK: - User Data Model
    func updateUserDataJSON(user: UserModel?) {
        guard let userData = user else { return }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: userData.toJSON(), options: JSONSerialization.WritingOptions(rawValue : 0))
            kvoStore.set(data, forKey: GLOBAL_USER_DATA)
            kvoStore.synchronize()
        }catch{
            Log.error("Error while serializing User Data to Preferences, error: \(error)")
        }
    }
    
    func getUser() -> UserModel {
        guard let anyData = kvoStore.value(forKey: GLOBAL_USER_DATA) else {
            return UserModel()
        }

        if let data = anyData as? Data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                if let user = Mapper<UserModel>().map(JSONObject: json) {
                    return user
                }
            }catch{
                Log.error("Error while serializing User Data to Preferences, error: \(error)")
            }
        }
        
        return UserModel()
    }
    
    func removeUser() {
        kvoStore.removeObject(forKey: GLOBAL_USER_DATA)
        kvoStore.synchronize()
    }
    
    func updateLanguage(language: String?) {
        guard let language = language, language.count > 0 else {
            removeLanguage()
            return
        }
        
        kvoStore.set(language, forKey: GLOBAL_LANGUAGE)
        kvoStore.synchronize()
    }
    
    func getLanguage() -> String {
        guard let language = kvoStore.object(forKey: GLOBAL_LANGUAGE) as? String else {
            return ""
        }
        return language
    }
    
    func removeLanguage() {
        kvoStore.removeObject(forKey: GLOBAL_LANGUAGE)
        kvoStore.synchronize()
    }
    
    func isRememberSignin() {
        kvoStore.set(true, forKey: GLOBAL_REMEMBER_SIGNIN)
        kvoStore.synchronize()
    }
    
    func getIsRememberSignin() -> Bool {
        guard let isRememberSignin = kvoStore.object(forKey: GLOBAL_REMEMBER_SIGNIN) as? Bool else {
            return false
        }
        return isRememberSignin
    }
    
    func removeIsRememberSignin() {
        kvoStore.removeObject(forKey: GLOBAL_REMEMBER_SIGNIN)
        kvoStore.synchronize()
    }
    
}
