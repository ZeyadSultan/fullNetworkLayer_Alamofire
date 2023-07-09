//
//  BaseAPI.swift
//  fullNetworkLayer_Alamofire
//
//  Created by Zeyad on 09/07/2023.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion:@escaping (Result<M?,NSError>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.methods.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParams(task: target.task)
        AF.request(target.baseURL + target.path, method: method, parameters: params.0, encoding: params.1, headers: headers).responseJSON { (response) in
            guard let statusCode = response.response?.statusCode else {
                //add error
                completion(.failure(NSError()))
                return
            }
            if statusCode == 200 {
                //successfull request
                guard let jsonResponse = try? response.result.get() else {
                    // add custom error
                    completion(.failure(NSError()))
                    return
                }
                
                guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse,options: []) else {
                    // add custom error
                    completion(.failure(NSError()))
                    return
                }
                
                guard let responseObj = try? JSONDecoder().decode(M.self, from: theJSONData) else {
                    // add custom error
                    completion(.failure(NSError()))
                    return
                }
                completion(.success(responseObj))
            }else {
                // add custom error
                completion(.failure(NSError()))
            }
            
        }
    }
    
    
    private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
        switch task {
            
        case .requestPlain:
            return([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters,encoding)
        }
    }
    
}
