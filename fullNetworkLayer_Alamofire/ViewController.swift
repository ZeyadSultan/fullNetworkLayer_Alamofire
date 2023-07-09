//
//  ViewController.swift
//  fullNetworkLayer_Alamofire
//
//  Created by Zeyad on 09/07/2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let api: UsersAPIProtocol = UsersAPI()
        api.getUsers { (result) in
            switch result {
                
            case .success(let response):
                let users = response?.data
                for user in users ?? [] {
                    print("\(String(describing: user.lastName)) \(String(describing: user.lastName))")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    

}

