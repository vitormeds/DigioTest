//
//  HomeView.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import UIKit

protocol HomeControllerToViewDelegate {
    func setupLoading(play: Bool)
    func reloadView()
}

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Identifier has not been implemeted")
    }
    
    func setupViews()
    {
        backgroundColor = UIColor.blue
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension HomeView: HomeControllerToViewDelegate {
    
    func setupLoading(play: Bool) {
        
    }
    
    func reloadView() {

    }
}
