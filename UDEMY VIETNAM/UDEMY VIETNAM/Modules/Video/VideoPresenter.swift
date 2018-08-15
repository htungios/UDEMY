//  
//  VideoPresenter.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 8/3/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

protocol VideoPresenterOutput {
    func playVideo(video: VideoListViewModel)
}

class VideoPresenter {

    var output: VideoPresenterOutput?

}

extension VideoPresenter: VideoInteractorOutput {

    func playVideo(video: VideoListViewModel) {
        output?.playVideo(video: video)
    }
    
}
