//  
//  LeftMenuPresenter.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 8/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import ObjectMapper

protocol LeftMenuPresenterOutput {
    func showImages(data: [MenuImageModel])
}

class LeftMenuPresenter {

    var output: LeftMenuPresenterOutput?

}

extension LeftMenuPresenter: LeftMenuInteractorOutput {

    func showImages(json: JSON) {
        if let images = json.arrayObject {
            if let data = Mapper<MenuImageModel>().mapArray(JSONObject: images) {
                output?.showImages(data: data)
            }
        }
    }
    
}
