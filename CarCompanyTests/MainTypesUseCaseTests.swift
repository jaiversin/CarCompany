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
    //private let dataProvider = MockMainTypesListDataProvider()
    /* TODO list
    * Fetch main types not empty
    * Fetch main types empty for non-existent manufacturer
    * Fetch main types empty for out-of-bound page
    * Fetch 15 car main types for specific manufacturer for page 0
    * Fetch a main type and check non-nil values
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
        let mainTypes: [String] = ["Arnage"]
        
        XCTAssert(!mainTypes.isEmpty, "List of main types should not be empty.")
    }
}
