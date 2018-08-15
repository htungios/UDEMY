//  
//  VideoListWireframe.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/31/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class VideoListWireframe {
    
    let viewController: UIViewController
    
    init(course: CourseViewModel) {
        
        let view = Constant.MAIN_SB.instantiateViewController(withIdentifier: "VideoListViewController") as! VideoListViewController
        let interactor = VideoListInteractor(course: course)
        let presenter = VideoListPresenter()
        
        viewController = view
        
        view.output = interactor
        interactor.output = presenter
        interactor.router = self
        presenter.output = view
        
    }
    
}

extension VideoListWireframe: VideoListInteractorRouter {

    func showError(view: UIViewController, error: String) {
        viewController.showError(error: error)
    }
    
    func playVideo(from view: UIViewController, index: Int, videos: [VideoListViewModel]) {
        let vc = VideoWireframe(index: index, videos: videos).viewController
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
}
