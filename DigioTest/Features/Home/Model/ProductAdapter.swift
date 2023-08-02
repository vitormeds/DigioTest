//
//  ProductAdapter.swift
//  DigioTest
//
//  Created by Vitor Mendes on 02/08/23.
//

import Foundation

struct ProductAdapter {
    
    enum ProductType {
        case cash
        case product
        case spotlight
    }
    
    let name: String
    let imageURL: String
    let productDescription: String
    let type: ProductType
}
