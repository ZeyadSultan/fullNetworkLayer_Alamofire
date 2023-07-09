//
//  UsersNetworking.swift
//  fullNetworkLayer_Alamofire
//
//  Created by Zeyad on 09/07/2023.
//

import Foundation
import Alamofire

enum UsersNetworking {
    case getUsers
    case createUsers(name: String, job: String)
}

extension UsersNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return "https://reqres.in/api"
        }
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .createUsers:
            return "/users"
        }
    }
    
    var methods: HTTPMethod {
        switch self{
        case .getUsers:
            return .get
        case .createUsers:
            return .post
        }
    }
    
    var task: Task {
        switch self{
        case .getUsers:
            return .requestPlain
        case .createUsers(name: let name, job: let job):
            return .requestParameters(parameters: ["name" : name, "job": job], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return[:]
        }
    }
    
    
}
