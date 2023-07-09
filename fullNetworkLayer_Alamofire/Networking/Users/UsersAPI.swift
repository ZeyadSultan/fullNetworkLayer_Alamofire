//
//  UsersAPI.swift
//  fullNetworkLayer_Alamofire
//
//  Created by Zeyad on 09/07/2023.
//

import Foundation


protocol UsersAPIProtocol {
    func getUsers(completion:@escaping (Result<UsersResponse? ,NSError>) -> Void)
}

class UsersAPI: BaseAPI<UsersNetworking>,  UsersAPIProtocol {
        
    //MARK:- Requests
    
    func getUsers(completion:@escaping (Result<UsersResponse? ,NSError>) -> Void) {
        fetchData(target: .getUsers, responseClass: UsersResponse.self) { (result) in
            completion(result)
        }
    }
}
