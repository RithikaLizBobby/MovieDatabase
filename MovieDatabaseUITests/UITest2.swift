//
//  UITest2.swift
//  MovieDatabaseUITests
//
//  Created by RithikaP10 on 01/11/24.
//
//test case to ensure all filter options are displayed when the app is launched

import XCTest
final class UITest2: XCTestCase {
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        Thread.sleep(forTimeInterval: 5);
        let movieDatabaseLabel = app.staticTexts["Movie Database"]
        XCTAssertTrue(movieDatabaseLabel.exists, "The 'Movie Database' label is not displayed.")

        let yearButton = app.staticTexts["Year"]
        XCTAssertTrue(yearButton.exists, "The 'Year' button is not displayed.")

        let genreButton = app.staticTexts["Genre"]
        XCTAssertTrue(genreButton.exists, "The 'Genre' button is not displayed.")

        let directorsButton = app.staticTexts["Directors"]
        XCTAssertTrue(directorsButton.exists, "The 'Directors' button is not displayed.")

        let actorsButton = app.staticTexts["Actors"]
        XCTAssertTrue(actorsButton.exists, "The 'Actors' button is not displayed.")

        let allMoviesButton = app.buttons["All Movies"]
        XCTAssertTrue(allMoviesButton.exists, "The 'All Movies' button is not displayed.")
    }
}
