//
//  HomeSnapshotTests.swift
//  DigioTestTests
//
//  Created by Vitor Mendes on 02/08/23.
//

import XCTest
import FBSnapshotTestCase
@testable import DigioTest

final class HomeSnapshotTests: FBSnapshotTestCase {

    var viewModel: HomeViewModel!
    var service = HomeServiceMock()
    var controllerSpy = HomeViewControllerSpy()
    var coordinatorSpy = MainCoordinatorSpy()
    
    override func setUp() {
        super.setUp()
        self.recordMode = false
        viewModel = HomeViewModel(homeService: service, coordinatorDelegate: coordinatorSpy)
        viewModel.homeData = HomeData(
            spotlight:
                [
                    Spotlight(name: "NameS",
                              bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
                              description: "descriptionS"),
                    Spotlight(name: "NameS",
                              bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
                              description: "descriptionS")
                ],
            products:
                [
                    Product(name: "nameP",
                            imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
                            description: "descriptionP"),
                    Product(name: "nameP",
                            imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
                            description: "descriptionP")
                ],
            cash:
                Cash(title: "titleC",
                     bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png",
                     description: "descriptionC"))
        viewModel.homeViewDelegate = controllerSpy
    }
    
    func testHome() {
        let viewController = HomeViewController(viewModel: viewModel)
        viewController.view.frame = UIScreen.main.bounds
        let callService = XCTestExpectation()
        viewController.loadSucess()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
           callService.fulfill()
       }
       wait(for: [callService], timeout: 5)
       FBSnapshotVerifyViewController(viewController)
    }
    
    func testDetailSpotlight() {
        let product = ProductAdapter(name: "Recarga",
                                     imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
                                     productDescription: "Agora ficou mais fácil colocar créditos no seu celular! A digio Store traz a facilidade de fazer recargas... direto pelo seu aplicativo, com toda segurança e praticidade que você procura.",
                                     type: .spotlight)
        let viewController = DetailViewController(viewModel: DetailViewModel(product: product))
        viewController.view.frame = UIScreen.main.bounds
        let callService = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
           callService.fulfill()
       }
       wait(for: [callService], timeout: 5)
       FBSnapshotVerifyViewController(viewController)
    }
    
    func testDetailProduct() {
        let product = ProductAdapter(name: "XBOX",
                                     imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
                                     productDescription: "Com o e-Gift Card Xbox você adquire créditos para comprar games, música, filmes, programas de TV e muito mais!",
                                     type: .product)
        let viewController = DetailViewController(viewModel: DetailViewModel(product: product))
        viewController.view.frame = UIScreen.main.bounds
        let callService = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
           callService.fulfill()
       }
       wait(for: [callService], timeout: 5)
       FBSnapshotVerifyViewController(viewController)
    }
    
    func testDetailCash() {
        let product = ProductAdapter(name: "digio Cash",
                                     imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png",
                                     productDescription: "Dinheiro na conta sem complicação. Transfira parte do limite do seu cartão para sua conta.",
                                     type: .cash)
        let viewController = DetailViewController(viewModel: DetailViewModel(product: product))
        viewController.view.frame = UIScreen.main.bounds
        let callService = XCTestExpectation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
           callService.fulfill()
       }
       wait(for: [callService], timeout: 5)
       FBSnapshotVerifyViewController(viewController)
    }
}

