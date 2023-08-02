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
    func setupError(error: Error)
}

protocol HomeViewModelToViewDelegate: AnyObject {
    func loadSucess()
    func loadError(error: Error)
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
        } error: { error in
            self.homeViewDelegate?.loadError(error: error)
        }
    }
    func openDetail(homeData: HomeData) {
        coordinatorDelegate?.openDetail(homeData: homeData)
    }
    func setupError(error: Error) {
        coordinatorDelegate?.openError(error: error, reloadAction: getHomeData)
    }
}
