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
    let viewModel = ManufacturersListViewModel(useCasesLocator: MockUseCasesLocator())
    
    /* TODO list
     * Test fetch manufacturers for page 0 (15 results) ✅
     * Test fetch next page having more than 15 results ✅
     * Test fetch page 0 after having results ✅
     * Test fetch same page as before
     */
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchManufacturersPageZero() {
        viewModel.onListDidChange = {
            XCTAssert(!(self.viewModel.manufacturers ?? []).isEmpty, "Manufacturers list should not be empty")
            XCTAssert((self.viewModel.manufacturers ?? []).count == 15, "There should be 15 manufacturers for first page")
        }
        viewModel.page = 0
    }
    
    func testFetchManufacturersNextPage() {
        viewModel.onListDidChange = {
            XCTAssert(!(self.viewModel.manufacturers ?? []).isEmpty, "Manufacturers list should not be empty")
            XCTAssert((self.viewModel.manufacturers ?? []).count == 15, "There should be more than 15 manufacturers for second page")
        }
        
        viewModel.page = 0
        
        viewModel.onListDidChange = {
            XCTAssert(!(self.viewModel.manufacturers ?? []).isEmpty, "Manufacturers list should not be empty")
            XCTAssert((self.viewModel.manufacturers ?? []).count >= 15, "There should be more than 15 manufacturers for second page")
        }
        
        viewModel.page = 1
    }
    
    func testFetchManufacturersNextPageBackToZero() {
        viewModel.onListDidChange = {
            XCTAssert(!(self.viewModel.manufacturers ?? []).isEmpty, "Manufacturers list should not be empty")
            XCTAssert((self.viewModel.manufacturers ?? []).count == 15, "There should be more than 15 manufacturers for second page")
        }
        
        viewModel.page = 0
        
        viewModel.onListDidChange = {
            XCTAssert(!(self.viewModel.manufacturers ?? []).isEmpty, "Manufacturers list should not be empty")
            XCTAssert((self.viewModel.manufacturers ?? []).count == 15, "There should be only 15 manufacturers for page 0 again.")
        }
        
        viewModel.page = 0
        XCTAssert((viewModel.manufacturers ?? []).isEmpty, "Manufacturers list should be empty before fetching")
    }
    
    func testFetchManufacturersNextPageSameAsPrevious() {
        viewModel.onListDidChange = {
            XCTAssert(!(self.viewModel.manufacturers ?? []).isEmpty, "Manufacturers list should not be empty")
            XCTAssert((self.viewModel.manufacturers ?? []).count == 15, "There should be more than 15 manufacturers for second page")
        }
        
        viewModel.page = 0
        viewModel.onListDidChange = {
            XCTAssert(!(self.viewModel.manufacturers ?? []).isEmpty, "Manufacturers list should not be empty")
            XCTAssert((self.viewModel.manufacturers ?? []).count >= 15, "There should be more than 15 manufacturers for second page")
        }
        
        viewModel.page = 1
        
        viewModel.onListDidChange = {
            XCTAssert(!(self.viewModel.manufacturers ?? []).isEmpty, "Manufacturers list should not be empty")
            XCTAssert((self.viewModel.manufacturers ?? []).count == 30, "There should be 30 manufacturers for the same page")
        }
        
        viewModel.page = 1
    }
}
