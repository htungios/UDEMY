//
//  UserModel.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/29/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import ObjectMapper

class UserModel: BaseDataModel {
    enum PropertiesKey: String {
        case email
        case password
        case id
    }
    
    // MARK: - Properties
    
    var email: String = ""
    var password: String = ""
    var id: Int = 0
    
    // MARK: - Mappable
    override func mapping(map: ObjectMapper.Map) {
        super.mapping(map: map)
        
        self.email        <- map[PropertiesKey.email.rawValue]
        self.id        <- map[PropertiesKey.id.rawValue]
    }
    
}
