//
//  DetailViewModel.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
    var product: ProductAdapter { get set }
}

class DetailViewModel: DetailViewModelDelegate {

    var product: ProductAdapter
    init(product: ProductAdapter) {
        self.product = product
    }
}
