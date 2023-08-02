//
//  MainCoordinatorSpy.swift
//  DigioTest
//
//  Created by Vitor Mendes on 02/08/23.
//

import Foundation
@testable import DigioTest

class MainCoordinatorSpy: MainCoordinatorDelegate {
    
    var openDetailCount = 0
    var openErrorCount = 0
    var product = ProductAdapter(name: "", imageURL: "", productDescription: "", type: .cash)

    func openDetail(product: ProductAdapter) {
        openDetailCount += 1
        self.product = product
    }
    func openError(reloadAction: @escaping () -> Void) {
        openErrorCount += 1
    }
}
