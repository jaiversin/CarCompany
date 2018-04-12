//
//  ManufacturersServiceTests.swift
//  CarCompanyTests
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import XCTest
@testable import CarCompany

class ManufacturersServiceTests: XCTestCase {
    
    /* TODO list
     * Service call success fetching 15 results for page 0 ✅
     */
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchFifteenResultsPageZero() {
        let service = ManufacturersService()
        let fetchManufacturers = expectation(description: "fetchManufacturers")
        service.getManufacturers(forPage: 0, results: 15) { (response) in
            switch response {
            case .success(let manufacturers):
                XCTAssertEqual(manufacturers.count, 15, "The fetch should bring 15 results for page 0")
            case .failure, .noInternetConnection:
                XCTFail("Data provider error")
            }
            
            fetchManufacturers.fulfill()
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
}
