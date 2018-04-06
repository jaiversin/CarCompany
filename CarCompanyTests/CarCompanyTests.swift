//
//  CarCompanyTests.swift
//  CarCompanyTests
//
//  Created by Jhon on 4/5/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import XCTest
@testable import CarCompany

class CarCompanyTests: XCTestCase {
    
    /* TODO list
     * Fetch manufacturers
     * Fetch 15 manufacturers for page 0
     * Fetch 0 manufacturers for page 100
     * Fetch manufacturers
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
    
    func testFetchManufacturers () {
        let manufacturers: [Manufacturer] = []
        let manufacturersService: ManufacturerService
        
        XCTAssert(!manufacturers.isEmpty)
    }
}
