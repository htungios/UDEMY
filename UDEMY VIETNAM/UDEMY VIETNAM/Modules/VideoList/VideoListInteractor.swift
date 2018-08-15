//  
//  VideoListInteractor.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/31/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

protocol VideoListInteractorOutput {
    func showVideoList(json: JSON)
    func showCourseImage(imageURL: String)
}

protocol VideoListInteractorRouter: InteractorRouter {
    func playVideo(from view: UIViewController, index: Int, videos: [VideoListViewModel])
}

class VideoListInteractor {

    var output: VideoListInteractorOutput?
    var router: VideoListInteractorRouter?
    fileprivate var _course = CourseViewModel()
    
    init(course: CourseViewModel) {
        _course = course
    }

}

extension VideoListInteractor: VideoListViewOutput {

    func viewWillAppear(view: UIViewController) {
        output?.showCourseImage(imageURL: _course.courseImage)
        
        guard let prefs = GlobalContext.get(key: GlobalContext.PREFS) else { return }
        
        let user = prefs.getUser()
        
        UserProfileService.share.getVideoList(idUser: user.id, idCourse: _course.id, success: { [weak self] (json) in
            self?.output?.showVideoList(json: json)
        }) { [weak self] (response) in
            let error = DefaultRequestFailureHandler(response)
            self?.router?.showError(view: view, error: error)
        }
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
    
    func playVideo(from view: UIViewController, index: Int, videos: [VideoListViewModel]) {
        router?.playVideo(from: view, index: index, videos: videos)
    }
    
}
