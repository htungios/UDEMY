//
//  BaseDataModel.swift
//  Part On Demand
//
//  Created by TungHN on 2/10/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyJSON

class BaseDataModel: NSObject, Mappable {
    
    override init() {
        super.init()
    }
    
    // MARK: - Mappable
    
    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {
        
    }
    
}

