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
    func openDetail(homeData: HomeData)
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
    func openDetail(homeData: HomeData) {
        coordinatorDelegate?.openDetail(homeData: homeData)
    }
    func setupError() {
        coordinatorDelegate?.openError(reloadAction: {
            self.homeViewDelegate?.setupLoading(play: true)
            self.getHomeData()
        })
    }
}
