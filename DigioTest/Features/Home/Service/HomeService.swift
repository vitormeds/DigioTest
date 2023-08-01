//
//  HomeService.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import Foundation

protocol HomeServiceDelegate: AnyObject {
    func getHomeData(sucess: @escaping (HomeData) -> Void, error: @escaping (Error) -> Void)
}

class HomeService: HomeServiceDelegate {
    func getHomeData(sucess: @escaping (HomeData) -> Void, error: @escaping (Error) -> Void) {
        NetworkService.request(requestUrl: DigioTestStrings.Utils.homeApi,
                               method: .get,
                               object: HomeData.self) { result in
            sucess(result)
        } error: { requestError in
            error(requestError)
        }
    }
}
