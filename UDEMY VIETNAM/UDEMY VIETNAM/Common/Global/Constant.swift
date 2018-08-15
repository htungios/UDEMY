//
//  Constant.swift
//  Part On Demand
//
//  Created by TungHN on 2/10/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

// MARK: - AppDelegate instance

let appDelegate = UIApplication.shared.delegate as! AppDelegate

// MARK: - Share preferences

let prefs = GlobalContext.get(key: GlobalContext.PREFS)

struct Constant {
    
    // MARK: - API host
    
    static let API_HOST     = "http://tracking.udemyvietnam.vn/VideoService.asmx/"
    static let API_VIDEO_HOST = "http://210.211.96.151:1935/vod/_definst_/"
    static let SUFFIX_VIDEO = "/manifest.mpd"

}

extension Constant {
    
    // MARK: - API_PATH
    
    static let API_Login = "Login"
    static let API_Courses = "GetCourseList"
    static let API_Video_List = "GetVideoList"
    static let API_Status_Video = "ViewVideo"
    static let API_GET_PROMOTION = "GetLinkAd"
    static let API_GET_MENU_IMAGES = "GetImageAd"
    
    // MARK: - Default Color
    
    static let ACCENT_COLOR = UIColor(hexString: "47e528")
    static let PRIMARY_DARK_COLOR = UIColor(hexString: "303F9F")
    static let PRIMARY_COLOR = UIColor(hexString: "3f51b5")
    
    // MARK: - Storyboard
    
    static let MAIN_SB = UIStoryboard(name: "Main", bundle: nil)
    
}

enum ColorName: String {
    case azure          = "00adef"
    case lightishGreen  = "44db5e"
    case warmGreyTwo    = "9a9a9a"
    
    var color: UIColor? {
        return UIColor(hexString: rawValue)
    }
}

