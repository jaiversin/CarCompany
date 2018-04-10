//
//  CarCompanyTests.swift
//  CarCompanyTests
//
//  Created by Jhon on 4/5/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import XCTest
@testable import CarCompany

class ManufacturersUseCaseTests: XCTestCase {
    private let dataProvider = MockManufacturersListDataProvider()
    /* TODO list
     * Fetch manufacturers not empty  ✅
     * Fetch 15 manufacturers for page 0 ✅
     * Fetch 0 manufacturers for page 100 ✅
     * Fetch 5 manufacturers page 0 ✅
     * Fetch a manufacturer and check non-nil properties ✅
     * Fetch 15 car main types for specific manufacturer for page 0
     * Fetch 0 car main types for non existent manufacturer
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
        XCTAssert(!makeList(forPage: 0, results: 15).isEmpty)
    }
    
    func testFetchManufacturersPageZeroFifteenResults() {
        let list = makeList(forPage: 0, results: 15)
        
        XCTAssertEqual(list.count, 15, "Every page fetch should bring 15 results")
        XCTAssertEqual(list.first!, Manufacturer(id: 700, name: "Pontiac"), "Manufacturers should match")
    }
    
    func testFetchManufacturersPageZeroFiveResults() {
        let list = makeList(forPage: 0, results: 5)
        
        XCTAssertEqual(list.count, 5, "Every page fetch should bring 5 results")
    }
    
    func testFetchNoResultsForOutOfBoundsPage() {
        XCTAssert(makeList(forPage: 6, results: 15).isEmpty, "Should return empty array when attempting to fetch out of bound page")
    }
}

fileprivate extension ManufacturersUseCaseTests {
    func makeList(forPage page: Int, results: Int) -> [Manufacturer] {
        let manufacturersList = ManufacturersListImpl(dataProvider: dataProvider)
        return manufacturersList.listManufacturers(page: page, results: results)
    }
}
