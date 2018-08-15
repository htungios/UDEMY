//
//  VideoListViewModel.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/31/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import ObjectMapper

class VideoListViewModel: BaseDataModel {
    enum PropertiesKey: String {
        case tenBai
        case status
        case session_name
        case is_session
        case link
        case id
    }
    
    // MARK: - Properties
    
    var tenBai: String = ""
    var status: Bool = true
    var session_name: String = ""
    var is_session: Bool = true
    var link: String = ""
    var id: Int = 0
    
    // MARK: - Mappable
    override func mapping(map: ObjectMapper.Map) {
        super.mapping(map: map)
        
        self.tenBai             <- map[PropertiesKey.tenBai.rawValue]
        self.status             <- map[PropertiesKey.status.rawValue]
        self.session_name       <- map[PropertiesKey.session_name.rawValue]
        self.is_session         <- map[PropertiesKey.is_session.rawValue]
        self.link               <- map[PropertiesKey.link.rawValue]
        self.id                 <- map[PropertiesKey.id.rawValue]
    }
    
}

