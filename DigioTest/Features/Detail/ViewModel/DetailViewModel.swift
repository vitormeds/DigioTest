//
//  DetailViewModel.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import Foundation

protocol DetailViewModelDelegate {
}

class DetailViewModel: DetailViewModelDelegate {

    let homeData: HomeData
    
    init(homeData: HomeData) {
        self.homeData = homeData
    }
}
