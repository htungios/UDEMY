//  
//  VideoInteractor.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 8/3/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

protocol VideoInteractorOutput {
    func playVideo(video: VideoListViewModel)
}

protocol VideoInteractorRouter: InteractorRouter {

}

class VideoInteractor {

    var output: VideoInteractorOutput?
    var router: VideoInteractorRouter?
    fileprivate var _index: Int = 0
    fileprivate var _videos = [VideoListViewModel]()
    
    init(index: Int, videos: [VideoListViewModel]) {
        _index = index
        _videos = videos
    }

}

extension VideoInteractor: VideoViewOutput {

    func viewWillAppear(view: UIViewController) {
        output?.playVideo(video: _videos[_index])
    }
    
    func updateVideoStatus(view: UIViewController, video: VideoListViewModel) {
        guard let prefs = GlobalContext.get(key: GlobalContext.PREFS) else { return }
        
        let user = prefs.getUser()
        
        UserProfileService.share.updateStatusVideo(idUser: user.id, idVideo: video.id, success: {
            
        }) { [weak self] (response) in
            let error = DefaultRequestFailureHandler(response)
            self?.router?.showError(view: view, error: error)
        }
    }
    
    func previousVideo() {
        if _index == 0 {
            return
        }
        
        _index-=1
        output?.playVideo(video: _videos[_index])
    }
    
    func nextVideo() {
        if _index == _videos.count - 1 {
            return
        }
        
        _index+=1
        output?.playVideo(video: _videos[_index])
    }
    
}
