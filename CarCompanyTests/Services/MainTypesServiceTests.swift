//
//  MainTypesServiceTests.swift
//  CarCompanyTests
//
//  Created by Jhon on 4/12/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import XCTest
@testable import CarCompany

class MainTypesServiceTests: XCTestCase {
    
    /* TODO list
     * Service call success fetching 15 results for page 0 ✅
     * Test failure case 🙈
     * Test no internet connection 🙈
     */
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /// Please fulfill the endpont and waKey on the Service before running
    func testFetchFifteenResultsPageZero() {
        let service = MainTypesService()
        let fetchMainTypes = expectation(description: "fetchMainTypes")
        service.getMainTypes(manufacturer: "720", page: 0, results: 15) { (response) in
            switch response {
            case .success(let mainTypes):
                XCTAssertEqual(mainTypes.count, 15, "The fetch should bring 15 results for page 0")
            case .failure, .noInternetConnection:
                XCTFail("Data provider error")
            }
            
            fetchMainTypes.fulfill()
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
}
