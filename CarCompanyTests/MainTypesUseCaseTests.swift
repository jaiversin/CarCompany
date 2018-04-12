//
//  MainTypesUseCaseTests.swift
//  CarCompanyTests
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import XCTest
@testable import CarCompany

class MainTypesUseCaseTests: XCTestCase {
    private let list = MainTypesListImpl(dataProvider: MockMainTypesListDataProvider())
    /* TODO list
    * Fetch main types not empty ✅
    * Fetch main types empty for non-existent manufacturer ✅
    * Fetch main types empty for out-of-bound page ✅
    * Fetch 15 car main types for specific manufacturer for page 0 ✅
    * Fetch a main type and check non-nil values ✅
    */
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchMainTypesNotEmpty() {
        let fetchMainTypes = expectation(description: "fetchMainTypes")
        
        list.listMainTypes(manufacturer: "720", page: 0, results: 15) { (response) in
            switch response {
            case .success(let types):
                XCTAssertEqual(types.count, 15, "There should be 15 results")
                XCTAssertEqual(types.first, MainType(name: "5"), "Main Types should match")
            case .failure, .noInternetConnection:
                XCTFail("Data provider error")
            }
            
            fetchMainTypes.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testFetchMainTypesEmptyForNonExistentManufacturer() {
        let fetchMainTypes = expectation(description: "fetchMainTypes")
        
        list.listMainTypes(manufacturer: "7200", page: 0, results: 15) { (response) in
            switch response {
            case .success(let types):
                XCTAssert(types.isEmpty, "List of main types for non existing manufacturer should be empty.")
            case .failure, .noInternetConnection:
                XCTFail("Data provider error")
            }
            
            fetchMainTypes.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testFetchMainTypesEmptyForOutOfBoundsPage() {
        let fetchMainTypes = expectation(description: "fetchMainTypes")
        
        list.listMainTypes(manufacturer: "720", page: 4, results: 15) { (response) in
            switch response {
            case .success(let types):
                XCTAssert(types.isEmpty, "List of main types for out of bounds page should be empty.")
            case .failure, .noInternetConnection:
                XCTFail("Data provider error")
            }
            
            fetchMainTypes.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
}
