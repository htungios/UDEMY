//  
//  VideoWireframe.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 8/3/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class VideoWireframe {
    
    let viewController: UIViewController
    
    init(index: Int, videos: [VideoListViewModel]) {
        
        let view = Constant.MAIN_SB.instantiateViewController(withIdentifier: "VideoViewController") as! VideoViewController
        let interactor = VideoInteractor(index: index, videos: videos)
        let presenter = VideoPresenter()
        
        viewController = view
        
        view.output = interactor
        interactor.output = presenter
        interactor.router = self
        presenter.output = view
        
    }
    
}

extension VideoWireframe: VideoInteractorRouter {

}
