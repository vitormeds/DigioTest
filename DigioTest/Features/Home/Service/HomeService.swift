//
//  HomeService.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import Foundation

protocol HomeServiceDelegate {
    func getHomeData(sucess: @escaping (HomeData)-> Void, error: @escaping (Error)-> Void)
}

class HomeService: HomeServiceDelegate {
    
    func getHomeData(sucess: @escaping (HomeData)-> Void, error: @escaping (Error)-> Void) {
        NetworkService.request(url: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products/", method: .get, obj: HomeData.self) { result in
            sucess(result)
        } error: { e in
            error(e)
        }
    }
}
