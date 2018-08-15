//
//  UserProfileAPI.swift
//  Part On Demand
//
//  Created by TungHN on 3/14/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import Moya
import MoyaSugar

enum UserProfileAPI {
    case login(email: String, password: String)
    case courses(idUser: Int)
    case videoList(idUser: Int, idCourse: Int)
    case updateVideoStatus(idUser: Int, idVideo: Int)
    case getPromotion(idUser: Int)
    case getMenuImages(idUser: Int)
}

extension UserProfileAPI: TargetType {
    
    var route: Route {
        switch self {
        case .login(_):
            return .post(Constant.API_Login)
        case .courses(_):
            return .post(Constant.API_Courses)
        case .videoList(_, _):
            return .post(Constant.API_Video_List)
        case .updateVideoStatus(_, _):
            return .post(Constant.API_Status_Video)
        case .getPromotion(_):
            return .post(Constant.API_GET_PROMOTION)
        case .getMenuImages(_):
            return .post(Constant.API_GET_MENU_IMAGES)
        }
    }
    
    var params: Parameters? {
        switch self {
        case .login(let email, let password):
            return URLEncoding.default => [
                "email": email,
                "password": password
            ]
        case .courses(let idUser):
            return URLEncoding.default => [
                "idUser": idUser
            ]
        case .videoList(let idUser, let idCourse):
            return URLEncoding.default => [
                "idUser": idUser,
                "courseId": idCourse
            ]
        case .updateVideoStatus(let idUser, let idVideo):
            return URLEncoding.default => [
                "idUser": idUser,
                "idVideo": idVideo
            ]
        case .getPromotion(let idUser):
            return URLEncoding.default => [
                "idUser": idUser
            ]
        case .getMenuImages(let idUser):
            return URLEncoding.default => [
                "idUser": idUser
            ]
        }
    }
    
}
