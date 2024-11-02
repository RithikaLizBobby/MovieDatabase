//
//  UITest3.swift
//  MovieDatabaseUITests
//
//  Created by RithikaP10 on 01/11/24.
//
//test case to view all movies by clicking on all movies button
import XCTest

final class UITest3: XCTestCase {
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        app.collectionViews["Sidebar"].staticTexts["All Movies"].tap()
    }
}
