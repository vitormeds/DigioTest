//
//  MainCoordinator.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    func openDetail(homeData: HomeData)
    func openError(error: Error, reloadAction: @escaping () -> Void)
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = HomeViewModel(homeService: HomeService(), coordinatorDelegate: self)
        let viewController = HomeViewController(viewModel: viewModel)
        viewModel.homeViewDelegate = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension MainCoordinator: MainCoordinatorDelegate {
    func openDetail(homeData: HomeData) {
        let backButton = UIBarButtonItem()
        backButton.title = DigioTestStrings.Utils.back
        navigationController.navigationBar.topItem?.backBarButtonItem = backButton
        let viewModel = DetailViewModel(homeData: homeData)
        let viewController = DetailViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    func openError(error: Error, reloadAction: @escaping () -> Void) {
        let viewController = CustomModalViewController(
            errorTitle: "Ocorreu um erro inesperado",
            errorDescription: "Ocorreu um erro de rede por favor tente novamente mais tarde",
            reloadAction: reloadAction)
        viewController.modalPresentationStyle = .overCurrentContext
        navigationController.present(viewController, animated: false)
    }
}
