//
//  HomeServiceMock.swift
//  DigioTest
//
//  Created by Vitor Mendes on 02/08/23.
//

import Foundation
@testable import DigioTest

class HomeServiceMock: HomeServiceDelegate {
    
    var resultSucess = true
    var homeData = HomeData(
        spotlight:
            [
                Spotlight(name: "NameS",
                          bannerURL: "bannerURLS",
                          description: "descriptionS")
            ],
        products:
            [
                Product(name: "nameP",
                        imageURL: "imageURLP",
                        description: "descriptionP")
            ],
        cash:
            Cash(title: "titleC",
                 bannerURL: "bannerURLC",
                 description: "descriptionC"))
    
    func getHomeData(sucess: @escaping (HomeData) -> Void, error: @escaping (Error) -> Void) {
        if resultSucess {
            sucess(
                homeData
            )
        } else {
            error(CustomError(title: "", description: "", code: 0))
        }
    }
}

protocol OurErrorProtocol: LocalizedError {

    var title: String? { get }
    var code: Int { get }
}

struct CustomError: OurErrorProtocol {

    var title: String?
    var code: Int
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }

    private var _description: String

    init(title: String?, description: String, code: Int) {
        self.title = title ?? "Error"
        self._description = description
        self.code = code
    }
}
