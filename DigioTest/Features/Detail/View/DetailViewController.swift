//
//  DetailViewController.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    let viewModel: DetailViewModelDelegate
    
    init(viewModel: DetailViewModelDelegate) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
