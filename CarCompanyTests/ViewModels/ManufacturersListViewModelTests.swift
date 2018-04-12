//
//  ManufacturersListViewModelTests.swift
//  CarCompanyTests
//
//  Created by Jhon on 4/12/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import XCTest
@testable import CarCompany

class ManufacturersListViewModelTests: XCTestCase {
    /* TODO list
     * Test fetch manufacturers
     */
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchManufacturers() {
        let useCasesLocator = MockUseCasesLocator()
        let viewModel = ManufacturersListViewModel(useCasesLocator: useCasesLocator)
        
        
    }
    
}
