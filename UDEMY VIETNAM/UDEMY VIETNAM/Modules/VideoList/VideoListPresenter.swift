//  
//  VideoListPresenter.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/31/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import ObjectMapper

protocol VideoListPresenterOutput {
    func showCourseImage(imageURL: String)
    func showVideoList(videos: [VideoListViewModel])
}

class VideoListPresenter {

    var output: VideoListPresenterOutput?

}

extension VideoListPresenter: VideoListInteractorOutput {

    func showCourseImage(imageURL: String) {
        output?.showCourseImage(imageURL: imageURL)
    }
    
    func showVideoList(json: JSON) {
        if let videoList = json.arrayObject {
            if let data = Mapper<VideoListViewModel>().mapArray(JSONObject: videoList) {
                output?.showVideoList(videos: data)
            }
        }
    }
    
}
