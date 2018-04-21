//
//  ManufacturersUseCaseTests.swift
//  CarCompanyTests
//
//  Created by Jhon on 4/5/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import XCTest
@testable import CarCompany

class ManufacturersUseCaseTests: XCTestCase {
    private let manufacturersList = ManufacturersListImpl(dataProvider: MockManufacturersListDataProvider())
    /* TODO list
     * Fetch manufacturers not empty  ✅
     * Fetch 15 manufacturers for page 0 ✅
     * Fetch 0 manufacturers for page 100 ✅
     * Fetch 5 manufacturers page 0 ✅
     * Fetch a manufacturer and check non-nil properties ✅
     */
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchManufacturersNotEmpty() {
        let fetchManufacturers = expectation(description: "fetchManufacturers")
        manufacturersList.listManufacturers(page: 0, results: 15) { response in
            switch response {
            case .success(let manufacturers):
                XCTAssert(!manufacturers.isEmpty, "The fetch should not be empty")
            case .failure, .noInternetConnection:
                XCTFail("Data provider error")
            }
            
            fetchManufacturers.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testFetchManufacturersPageZeroFifteenResults() {
        let fetchManufacturers = expectation(description: "fetchManufacturers")
        manufacturersList.listManufacturers(page: 0, results: 15) { response in
            switch response {
            case .success(let manufacturers):
                XCTAssertEqual(manufacturers.count, 15, "Every page fetch should bring 15 results")
                XCTAssertEqual(manufacturers.first!, Manufacturer(id: "700", name: "Pontiac"), "Manufacturers should match")
            case .failure, .noInternetConnection:
                XCTFail("Data provider error")
            }
            
            fetchManufacturers.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testFetchManufacturersPageZeroFiveResults() {
        let fetchManufacturers = expectation(description: "fetchManufacturers")
        manufacturersList.listManufacturers(page: 0, results: 5) { response in
            switch response {
            case .success(let manufacturers):
                XCTAssertEqual(manufacturers.count, 5, "Every page fetch should bring 5 results")
            case .failure, .noInternetConnection:
                XCTFail("Data provider error")
            }
            
            fetchManufacturers.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testFetchNoResultsForOutOfBoundsPage() {
        let fetchManufacturers = expectation(description: "fetchManufacturers")
        manufacturersList.listManufacturers(page: 6, results: 5) { response in
            switch response {
            case .success(let manufacturers):
                XCTAssert(manufacturers.isEmpty, "Every page fetch should bring 5 results")
            case .failure, .noInternetConnection:
                XCTFail("Data provider error")
            }
            
            fetchManufacturers.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
}
