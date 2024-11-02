//
//  UITest1.swift
//  MovieDatabaseUITests
//
//  Created by RithikaP10 on 01/11/24.
//
//test case to filter by year and view the movie details from the year 2000
import XCTest
final class UITest1: XCTestCase {
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        let sidebarCollectionView = app.collectionViews["Sidebar"]
        sidebarCollectionView.staticTexts["Year"].tap()
        let scrollViewsQuery = sidebarCollectionView.scrollViews
        scrollViewsQuery.otherElements.buttons["2000"].tap()
        app.collectionViews.staticTexts["Meet the Parents"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Movie Database"].tap()
        app.navigationBars["Movie Database"].buttons["Movie Database"].tap()
        scrollViewsQuery.children(matching: .other).element(boundBy: 0).tap()
    }
}
