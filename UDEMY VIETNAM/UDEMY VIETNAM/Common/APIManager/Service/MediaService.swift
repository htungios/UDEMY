//
//  MediaService.swift
//  Part On Demand
//
//  Created by TungHN on 2/27/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import Alamofire

/*
class MediaService {
    static let share = MediaService()
    private init(){}
    fileprivate let provider = TSApiManager.shared.createProviderFor(ImageAPI.self)
}

extension MediaService {
    
    func downloadImage(apiPath: String, imageName:String, completion: ((Data) -> Void)?) {
        guard let accessToken = RegistrationService.share.accessToken else {
            return
        }
        
        let urlString = Constant.API_HOST + apiPath + imageName
        let url = URL(string: urlString)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(accessToken)"]

        Alamofire.request(url!, headers: headers).responseData { (response) in
            if response.error == nil {
                if let data = response.data {
                    completion?(data)
                }
            } else {
                SVProgressHUD.dismiss()
                SVProgressHUD.showError(withStatus: response.error.debugDescription)
            }
        }
    }
    
    open func uploadImage(image: Data, success: RequestSuccessWithDataClosure? = nil, failure: RequestFailureWithDataClosure? = nil) {
        TSApiManager.shared.request(api: ImageAPI.uploadImage(image: image),
                                    provider: provider,
                                    nextHandler: { (json) in
                                        success?(json)
        }) { (response) in
            failure?(response)
        }
    }
    
    open func uploadUserImage(image: Data, success: RequestSuccessWithDataClosure? = nil, failure: RequestFailureWithDataClosure? = nil) {
        TSApiManager.shared.request(api: ImageAPI.uploadUserImage(image: image),
                                    provider: provider,
                                    nextHandler: { (json) in
                                        success?(json)
        }) { (response) in
            failure?(response)
        }
    }
    
}
 */
