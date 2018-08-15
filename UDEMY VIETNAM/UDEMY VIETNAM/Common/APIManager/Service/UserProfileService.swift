//
//  UserProfileService.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/25/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class UserProfileService {
    static let share = UserProfileService()
    private init(){}
    fileprivate let provider = TSApiManager.shared.createProviderFor(UserProfileAPI.self)
}

extension UserProfileService {
    
    open func login(email: String, password: String, success: RequestSuccessWithDataClosure? = nil, failure: RequestFailureWithDataClosure? = nil) {
        SVProgressHUD.show()
        TSApiManager.shared.request(api: UserProfileAPI.login(email: email, password: password),
                                    provider: provider,
                                    nextHandler: { (json) in
                                        SVProgressHUD.dismiss()
                                        success?(json)
        }) { (response) in
            SVProgressHUD.dismiss()
            failure?(response)
        }
        
    }
    
    open func courses(idUser: Int, success: RequestSuccessWithDataClosure? = nil, failure: RequestFailureWithDataClosure? = nil) {
        SVProgressHUD.show()
        TSApiManager.shared.request(api: UserProfileAPI.courses(idUser: idUser),
                                    provider: provider,
                                    nextHandler: { (json) in
                                        SVProgressHUD.dismiss()
                                        success?(json)
        }) { (response) in
            SVProgressHUD.dismiss()
            failure?(response)
        }
    }
    
    open func getVideoList(idUser: Int, idCourse: Int, success: RequestSuccessWithDataClosure? = nil, failure: RequestFailureWithDataClosure? = nil) {
        SVProgressHUD.show()
        TSApiManager.shared.request(api: UserProfileAPI.videoList(idUser: idUser, idCourse: idCourse),
                                    provider: provider,
                                    nextHandler: { (json) in
                                        SVProgressHUD.dismiss()
                                        success?(json)
        }) { (response) in
            SVProgressHUD.dismiss()
            failure?(response)
        }
    }
    
    open func updateStatusVideo(idUser: Int, idVideo: Int, success: RequestSuccessClosure? = nil, failure: RequestFailureWithDataClosure? = nil) {
        SVProgressHUD.show()
        TSApiManager.shared.request(api: UserProfileAPI.updateVideoStatus(idUser: idUser, idVideo: idVideo),
                                    provider: provider,
                                    nextHandler: { (json) in
                                        SVProgressHUD.dismiss()
                                        success?()
        }) { (response) in
            SVProgressHUD.dismiss()
            failure?(response)
        }
    }
    
    open func getPromotion(idUser: Int, success: RequestSuccessWithAnyClosure? = nil, failure: RequestFailureClosure? = nil) {
        SVProgressHUD.show()
        guard let url = URL(string: Constant.API_HOST + Constant.API_GET_PROMOTION) else {
            return
        }
        
//        Alamofire.request(url,
//                          method: .post,
//                          parameters: ["idUser": idUser])
//            .validate()
//            .responseJSON { response in
//                guard response.result.isSuccess else {
//                    print("Error while fetching remote rooms: \(String(describing: response.result.error)")
//                        completion(nil)
//                    return
//                }
//
//                guard let value = response.result.value as? [String: Any],
//                    let rows = value["rows"] as? [[String: Any]] else {
//                        print("Malformed data received from fetchAllRooms service")
//                        completion(nil)
//                        return
//                }
//
//                let rooms = rows.flatMap { roomDict in return RemoteRoom(jsonData: roomDict) }
//                completion(rooms)
//        }
        Alamofire.request(url,
                          method: .post,
                          parameters: ["idUser" : idUser],
                          encoding: URLEncoding.default)
            .validate()
            .responseString { (response) in
                switch response.result {
                case .success(let resultStr):
                    success?(resultStr)
                case .failure(let error):
                    failure?(error.localizedDescription)
                }
                
        }
    }
    
    open func getMenuImages(idUser: Int, success: RequestSuccessWithDataClosure? = nil, failure: RequestFailureWithDataClosure? = nil) {
        SVProgressHUD.show()
        TSApiManager.shared.request(api: UserProfileAPI.getMenuImages(idUser: idUser),
                                    provider: provider,
                                    nextHandler: { (json) in
                                        SVProgressHUD.dismiss()
                                        success?(json)
        }) { (response) in
            SVProgressHUD.dismiss()
            failure?(response)
        }
    }
    
}

