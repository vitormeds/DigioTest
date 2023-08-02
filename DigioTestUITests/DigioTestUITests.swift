//
//  DigioTestUITests.swift
//  DigioTestUITests
//
//  Created by Vitor Mendes on 31/07/23.
//

import XCTest

final class DigioTestUITests: XCTestCase {

    func testOpenFirstSpotlightBanner() throws {
        let app = XCUIApplication()
        app.launch()
        
        let element = app.tables.children(matching: .cell).element(boundBy: 0).collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        element.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["R$: 10,00"]/*[[".buttons[\"R$: 10,00\"].staticTexts[\"R$: 10,00\"]",".staticTexts[\"R$: 10,00\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["Comprar"]/*[[".buttons[\"Comprar\"].staticTexts[\"Comprar\"]",".staticTexts[\"Comprar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testOpenFirstCashBanner() throws {
        let app = XCUIApplication()
        app.launch()
        let element = app.tables.children(matching: .cell).element(boundBy: 1)
        element.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.staticTexts["Transferir"].tap()
    }
    
    func testOpenFirstProductBanner() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.tables.cells.containing(.staticText, identifier:"Produtos").collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["R$: 10,00"]/*[[".buttons[\"R$: 10,00\"].staticTexts[\"R$: 10,00\"]",".staticTexts[\"R$: 10,00\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        elementsQuery/*@START_MENU_TOKEN@*/.staticTexts["Comprar"]/*[[".buttons[\"Comprar\"].staticTexts[\"Comprar\"]",".staticTexts[\"Comprar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                                                
    }
}
