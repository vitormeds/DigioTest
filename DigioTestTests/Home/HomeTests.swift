//
//  HomeTests.swift
//  DigioTest
//
//  Created by Vitor Mendes on 02/08/23.
//

import XCTest
@testable import DigioTest

final class HomeTests: XCTestCase {

    var viewModel: HomeViewModel!
    var service = HomeServiceMock()
    var controllerSpy = HomeViewControllerSpy()
    var coordinatorSpy = MainCoordinatorSpy()
    
    override func setUp() {
        viewModel = HomeViewModel(homeService: service, coordinatorDelegate: coordinatorSpy)
        viewModel.homeData = HomeData(spotlight:
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
        viewModel.homeViewDelegate = controllerSpy
    }
    
    func testLoadData() {
        viewModel.getHomeData()
        XCTAssertEqual(controllerSpy.loadSucessCount, 1)
        XCTAssertEqual(controllerSpy.loadErrorCount, 0)
    }
    
    func testLoadDataError() {
        service.resultSucess = false
        viewModel.getHomeData()
        XCTAssertEqual(controllerSpy.loadErrorCount, 1)
        XCTAssertEqual(controllerSpy.loadSucessCount, 0)
    }
    
    func testSetupError() {
        viewModel.setupError()
        XCTAssertEqual(coordinatorSpy.openErrorCount, 1)
    }

    func testOpenDetailCash() {
        viewModel.openDetail()
        XCTAssertEqual(coordinatorSpy.openDetailCount, 1)
        XCTAssertEqual(coordinatorSpy.product.imageURL, "bannerURLC")
        XCTAssertEqual(coordinatorSpy.product.name, "titleC")
        XCTAssertEqual(coordinatorSpy.product.productDescription, "descriptionC")
        XCTAssertEqual(coordinatorSpy.product.type, .cash)
    }
    
    func testOpenDetailProduct() {
        viewModel.openDetail(product: Product(name: "nameP", imageURL: "imageURLP", description: "descriptionP"))
        XCTAssertEqual(coordinatorSpy.openDetailCount, 1)
        XCTAssertEqual(coordinatorSpy.product.imageURL, "imageURLP")
        XCTAssertEqual(coordinatorSpy.product.name, "nameP")
        XCTAssertEqual(coordinatorSpy.product.productDescription, "descriptionP")
        XCTAssertEqual(coordinatorSpy.product.type, .product)

    }
    
    func testOpenDetailSpotlight() {
        viewModel.openDetail(spotlight: Spotlight(name: "titleC", bannerURL: "bannerURLC", description: "descriptionC"))
        XCTAssertEqual(coordinatorSpy.openDetailCount, 1)
        XCTAssertEqual(coordinatorSpy.product.imageURL, "bannerURLC")
        XCTAssertEqual(coordinatorSpy.product.name, "titleC")
        XCTAssertEqual(coordinatorSpy.product.productDescription, "descriptionC")
        XCTAssertEqual(coordinatorSpy.product.type, .spotlight)

    }
}

