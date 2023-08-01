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
        setupTableView()
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
    func setupTableView() {
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        homeView.tableView.register(SpotlightTableViewCell.self,
                                    forCellReuseIdentifier: SpotlightTableViewCell.description())
        homeView.tableView.register(ProductsTableViewCell.self,
                                    forCellReuseIdentifier: ProductsTableViewCell.description())
        homeView.tableView.register(CashTableViewCell.self,
                                    forCellReuseIdentifier: CashTableViewCell.description())
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SpotlightTableViewCell.description()) as! SpotlightTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ProductsTableViewCell.description()) as! ProductsTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CashTableViewCell.description()) as! CashTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
