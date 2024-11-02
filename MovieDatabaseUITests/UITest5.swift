//
//  UITest5.swift
//  MovieDatabaseUITests
//
//  Created by P10 on 02/11/24.
//
//test case to search for a movie
import XCTest
final class UITest5: XCTestCase {
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        let textfield = app.textFields["Search movies by title/actor/genre/direct..."]
        textfield.tap()
        textfield.typeText("Hello America")
        app.collectionViews["Sidebar"].staticTexts["Hello America"].tap()
    }
}
