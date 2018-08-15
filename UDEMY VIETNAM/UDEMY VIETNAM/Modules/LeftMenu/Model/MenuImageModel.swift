//
//  MenuImageModel.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 8/11/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

import ObjectMapper

class MenuImageModel: BaseDataModel {
    enum PropertiesKey: String {
        case image
        case link
        case text
    }
    
    // MARK: - Properties
    
    var image: String = ""
    var link: String = ""
    var text: String = ""
   
    // MARK: - Mappable
    override func mapping(map: ObjectMapper.Map) {
        super.mapping(map: map)
        
        self.image             <- map[PropertiesKey.image.rawValue]
        self.link             <- map[PropertiesKey.link.rawValue]
        self.text       <- map[PropertiesKey.text.rawValue]
    }
    
}

