//
//  HomeView.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import UIKit
import Lottie

protocol HomeControllerToViewDelegate: AnyObject {
    func setupValues(name: String)
    func setupLoading(play: Bool)
    func reloadView()
}

class HomeView: UIView {
    let headerView: HeaderView = {
        let headerView = HeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        return tableView
    }()
    private let loadingView: LottieAnimationView = {
        let loadingView = LottieAnimationView(name: DigioTestStrings.Animations.loading)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.loopMode = .loop
        loadingView.isHidden = true
        loadingView.play()
        return loadingView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Identifier has not been implemeted")
    }
    func setupViews() {
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerView)
        addSubview(tableView)
        addSubview(loadingView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Size.headerSize)
        ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: Spacing.normalSpacing),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingView.widthAnchor.constraint(equalToConstant: Size.loadingSize),
            loadingView.heightAnchor.constraint(equalToConstant: Size.loadingSize)
        ])
    }
}

extension HomeView: HomeControllerToViewDelegate {
    func setupValues(name: String) {
        headerView.setupValues(name: name)
    }
    func setupLoading(play: Bool) {
        loadingView.isHidden = !play
    }
    func reloadView() {
        tableView.reloadData()
    }
}
