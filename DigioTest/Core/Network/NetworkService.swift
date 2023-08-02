//
//  NetworkService.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import Foundation
import Alamofire

class NetworkService {
    static private var alamoFireManager: Session? = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        let alamoFireManager = Alamofire.Session(configuration: configuration)
        return alamoFireManager
    }()
    static func request<T: Codable>(requestUrl: String,
                                    method: HTTPMethod ,
                                    params: [String:Any]? = nil,
                                    object: T.Type,
                                    sucess: @escaping (T) -> Void,
                                    error: @escaping (Error) -> Void) {
        alamoFireManager?.request(requestUrl,
                                  method: method,
                                  encoding: URLEncoding.default)
            .response { response in
            switch response.result {
            case .success:
                do {
                    let resultObj = try JSONDecoder().decode(object.self, from: response.data ?? Data())
                    sucess(resultObj)
                } catch let decodeErr {
                    error(decodeErr)
                }
                return
            case .failure:
                error(response.error!)
                return
            }
        }
    }
}
