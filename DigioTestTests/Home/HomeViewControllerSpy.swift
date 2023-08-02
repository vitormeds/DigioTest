//
//  HomeViewControllerSpy.swift
//  DigioTest
//
//  Created by Vitor Mendes on 02/08/23.
//

import Foundation
@testable import DigioTest

class HomeViewControllerSpy: HomeViewModelToViewDelegate {

    var loadSucessCount = 0
    var loadErrorCount = 0
    var setupLoading = 0
    
    func loadSucess() {
        loadSucessCount += 1
    }
    
    func loadError() {
        loadErrorCount += 1
    }

    func setupLoading(play: Bool) {
        setupLoading += 1
    }
}
