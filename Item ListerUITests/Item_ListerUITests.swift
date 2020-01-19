//
//  Item_ListerUITests.swift
//  Item ListerUITests
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import XCTest

class Item_ListerUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()

        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

    func testFirstItemDetailValidity() {
        // Wait to see Home VC
        let headerViewAccessibilityIdentifier =
            Global.AccessibilityIdentifiers.HomeViewController.headerView
        waitToSee(object: app.otherElements[headerViewAccessibilityIdentifier])

        // Tap first cell
        let table = app.tables.element(boundBy: 0)
        let firstCell = table.cells.element(boundBy: 0)
        firstCell.tap()

        // Wait to see Item Detail VC
        let navigationBarAccessibilityIdentifier =
            Global.AccessibilityIdentifiers.ItemDetailViewController.navigationBar
        waitToSee(object: app.navigationBars[navigationBarAccessibilityIdentifier])

        // Validate scene elements
        let scrollView = app.scrollViews.element(boundBy: 0)
        let itemDetailStaticTexts = scrollView.otherElements.staticTexts
        let itemDetailButtons = scrollView.otherElements.buttons

        XCTAssertEqual(itemDetailStaticTexts.element(boundBy: 0).label,
                       "Jewelery")
        XCTAssertEqual(itemDetailStaticTexts.element(boundBy: 1).label,
                       "Unbranded Metal Pants")
        XCTAssertEqual(itemDetailStaticTexts.element(boundBy: 2).label,
                       "591.00 TL")
        XCTAssertEqual(itemDetailButtons.count, 2)
    }

    func testLastItemDetailValidity() {
        // Wait to see Home VC
        let headerViewAccessibilityIdentifier =
            Global.AccessibilityIdentifiers.HomeViewController.headerView
        waitToSee(object: app.otherElements[headerViewAccessibilityIdentifier])

        // Tap last cell(after swiping enough to find)
        let table = app.tables.element(boundBy: 0)
        let cellCount = table.cells.count
        let lastCell = table.cells.element(boundBy: cellCount - 1)

        while !lastCell.isHittable {
            table.swipeUp()
        }

        lastCell.tap()

        // Wait to see Item Detail VC
        let navigationBarAccessibilityIdentifier =
            Global.AccessibilityIdentifiers.ItemDetailViewController.navigationBar
        waitToSee(object: app.navigationBars[navigationBarAccessibilityIdentifier])

        // Validate scene elements
        let scrollView = app.scrollViews.element(boundBy: 0)
        let itemDetailStaticTexts = scrollView.otherElements.staticTexts
        let itemDetailButtons = scrollView.otherElements.buttons

        XCTAssertEqual(itemDetailStaticTexts.element(boundBy: 0).label,
                       "Grocery")
        XCTAssertEqual(itemDetailStaticTexts.element(boundBy: 1).label,
                       "Fantastic Metal Hat")
        XCTAssertEqual(itemDetailStaticTexts.element(boundBy: 2).label,
                       "419.00 TL")
        XCTAssertEqual(itemDetailButtons.count, 2)
    }

    // MARK: - Helper Methods

    private func waitToSee(object: Any?) {
        expectation(for: NSPredicate(format: "hittable == true"),
                    evaluatedWith: object,
                    handler: nil)
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
