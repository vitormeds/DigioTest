//
//  Coordinator.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
