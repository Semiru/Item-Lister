//
//  Item_ListerTests.swift
//  Item ListerTests
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

@testable import Item_Lister
import XCTest

let validURL = URL(string: "http://5e209e06e31c6e0014c60962.mockapi.io/api/products")
let invalidURL = URL(string: "http://5e209e06e31c6e0014c60962.mockapi.io/api")

var firstItem: Item!
var lastItem: Item!
var urlSession: URLSession!

class Item_ListerTests: XCTestCase {

    override func setUp() {
        super.setUp()

        firstItem = Item(id: "1",
                    category: "Jewelery",
                    name: "Unbranded Metal Pants",
                    price: "591.00",
                    image: "https://s3.amazonaws.com/uifaces/faces/twitter/mufaddal_mw/128.jpg")

        lastItem = Item(id: "50",
                        category: "Grocery",
                        name: "Fantastic Metal Hat",
                        price: "419.00",
                        image: "https://s3.amazonaws.com/uifaces/faces/twitter/osmond/128.jpg")

        urlSession = URLSession(configuration: .default)
    }

    override func tearDown() {
        firstItem = nil
        lastItem = nil
        urlSession = nil

        super.tearDown()
    }

    func testValidCallToAPIForFetchingItems() {
        let promise = expectation(description: "Fetch Items Succes For Valid URL")

        var statusCode: Int?
        var responseError: Error?

        let dataTask = urlSession.dataTask(with: validURL!) { _, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }

        dataTask.resume()
        wait(for: [promise], timeout: 5)

        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }

    func testInvalidCallToAPIForFetchingItems() {
        let promise = expectation(description: "Fetch Items Failure For Invalid URL")

        var statusCode: Int?
        var responseError: Error?

        let dataTask = urlSession.dataTask(with: invalidURL!) { _, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }

        dataTask.resume()
        wait(for: [promise], timeout: 5)

        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 404)
    }

    func testFirstItemValidity() {
        let promise = expectation(description: "Item Fetching Complete")

        var firstData: Item?

        let dataTask = urlSession.dataTask(with: validURL!) { data, _, _ in
            guard let data = data,
                let itemList = try? JSONDecoder().decode([Item].self, from: data) else {
                    promise.fulfill()
                    return
            }

            firstData = itemList[0]
            promise.fulfill()
        }

        dataTask.resume()
        wait(for: [promise], timeout: 5)

        XCTAssertEqual(firstItem.id, firstData!.id)
        XCTAssertEqual(firstItem.category, firstData!.category)
        XCTAssertEqual(firstItem.name, firstData!.name)
        XCTAssertEqual(firstItem.price, firstData!.price)
        XCTAssertEqual(firstItem.image, firstData!.image)
    }

    func testLastItemValidity() {
        let promise = expectation(description: "Item Fetching Complete")

        var lastData: Item?

        let dataTask = urlSession.dataTask(with: validURL!) { data, _, _ in
            guard let data = data,
                let itemList = try? JSONDecoder().decode([Item].self, from: data) else {
                    promise.fulfill()
                    return
            }

            lastData = itemList[itemList.count - 1]
            promise.fulfill()
        }

        dataTask.resume()
        wait(for: [promise], timeout: 5)

        XCTAssertEqual(lastItem.id, lastData!.id)
        XCTAssertEqual(lastItem.category, lastData!.category)
        XCTAssertEqual(lastItem.name, lastData!.name)
        XCTAssertEqual(lastItem.price, lastData!.price)
        XCTAssertEqual(lastItem.image, lastData!.image)
    }
}
