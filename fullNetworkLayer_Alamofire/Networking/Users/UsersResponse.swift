//
//  UsersResponse.swift
//  fullNetworkLayer_Alamofire
//
//  Created by Zeyad on 09/07/2023.
//

import Foundation

class UsersResponse: Codable {
    var data: [UserModel]?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
