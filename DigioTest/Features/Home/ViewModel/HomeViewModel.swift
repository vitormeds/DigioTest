//
//  HomeViewModel.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func getHomeData()
    var homeData: HomeData? { get set }
    func openDetail(spotlight: Spotlight)
    func openDetail(product: Product)
    func openDetail()
    func setupError()
}

protocol HomeViewModelToViewDelegate: AnyObject {
    func loadSucess()
    func loadError()
    func setupLoading(play: Bool)
}

class HomeViewModel: HomeViewModelDelegate {

    let homeService: HomeServiceDelegate
    var homeViewDelegate: HomeViewModelToViewDelegate?
    var coordinatorDelegate: MainCoordinatorDelegate?
    var homeData: HomeData?
    init(homeService: HomeServiceDelegate, coordinatorDelegate: MainCoordinatorDelegate) {
        self.homeService = homeService
        self.coordinatorDelegate = coordinatorDelegate
    }
    func getHomeData() {
        homeService.getHomeData { result in
            self.homeData = result
            self.homeViewDelegate?.loadSucess()
        } error: { _ in
            self.homeViewDelegate?.loadError()
        }
    }
    func openDetail(spotlight: Spotlight) {
        let adapter = ProductAdapter(
            name: spotlight.name,
            imageURL: spotlight.bannerURL,
            productDescription: spotlight.description,
            type: .spotlight)
        coordinatorDelegate?.openDetail(product: adapter)
    }
    func openDetail(product: Product) {
        let adapter = ProductAdapter(
            name: product.name,
            imageURL: product.imageURL,
            productDescription: product.description,
            type: .product)
        coordinatorDelegate?.openDetail(product: adapter)
    }
    func openDetail() {
        guard let homeData = homeData else {
            return
        }
        let adapter = ProductAdapter(
            name: homeData.cash.title,
            imageURL: homeData.cash.bannerURL,
            productDescription: homeData.cash.description,
            type: .cash)
        coordinatorDelegate?.openDetail(product: adapter)
    }
    func setupError() {
        coordinatorDelegate?.openError(reloadAction: {
            self.homeViewDelegate?.setupLoading(play: true)
            self.getHomeData()
        })
    }
}
