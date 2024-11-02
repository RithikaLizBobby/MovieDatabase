//
//  UITest4.swift
//  MovieDatabaseUITests
//
//  Created by RithikaP10 on 01/11/24.
//
//test case to click the filtering options and expand it
import XCTest

final class UITest4: XCTestCase {
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        let yearStaticText = app.staticTexts["Year"]
        yearStaticText.tap()
        yearStaticText.tap()

        let genreStaticText = app.staticTexts["Genre"]
        genreStaticText.tap()
        genreStaticText.tap()

        let directorsStaticText = app.staticTexts["Directors"]
        directorsStaticText.tap()
        directorsStaticText.tap()

        let actorsStaticText = app.staticTexts["Actors"]
        actorsStaticText.tap()
        actorsStaticText.tap()
    }
}
