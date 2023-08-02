//
//  DetailViewModel.swift
//  DigioTest
//
//  Created by Vitor Mendes on 31/07/23.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
}

class DetailViewModel: DetailViewModelDelegate {

    let product: ProductAdapter
    init(product: ProductAdapter) {
        self.product = product
    }
}
