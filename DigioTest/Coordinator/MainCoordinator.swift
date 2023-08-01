//
//  MainCoordinator.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import UIKit

protocol MainCoordinatorDelegate {
    func openDetail(homeData: HomeData)
}

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = HomeViewModel(homeService: HomeService(), coordinatorDelegate: self)
        let vc = HomeViewController(viewModel: viewModel)
        viewModel.homeViewDelegate = vc
        navigationController.pushViewController(vc, animated: true)
    }
}

extension MainCoordinator: MainCoordinatorDelegate {
    
    func openDetail(homeData: HomeData) {
        let backButton = UIBarButtonItem()
        backButton.title = DigioTestStrings.Utils.back
        navigationController.navigationBar.topItem?.backBarButtonItem = backButton
        let viewModel = DetailViewModel(homeData: homeData)
        let vc = DetailViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
