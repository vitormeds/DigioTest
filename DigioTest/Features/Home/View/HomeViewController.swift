//
//  ViewController.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import UIKit

class HomeViewController: UIViewController {

    let viewModel: HomeViewModelDelegate
    let delegateToView: HomeControllerToViewDelegate
    let homeView: HomeView = {
        let homeView = HomeView()
        homeView.translatesAutoresizingMaskIntoConstraints = false
        return homeView
    }()
    init(viewModel: HomeViewModelDelegate, homeDelegate: HomeControllerToViewDelegate? = nil) {
        self.viewModel = viewModel
        self.delegateToView = homeDelegate ?? homeView
        super.init(nibName: nil, bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupViews()
        getHomeData()
        delegateToView.setupValues(name: "Maria")
    }
    func getHomeData() {
        viewModel.getHomeData()
    }
    func setupViews() {
        view.addSubview(homeView)
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewController: HomeViewModelToViewDelegate {
    func loadSucess() {

    }
    func loadError(error: Error) {

    }
}
