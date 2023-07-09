//
//  UserModel.swift
//  fullNetworkLayer_Alamofire
//
//  Created by Zeyad on 09/07/2023.
//

import Foundation

class UserModel: Codable {
    var firstName: String?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
