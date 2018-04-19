//
//  ManufacturersListViewModel.swift
//  CarCompany
//
//  Created by Jhon on 4/12/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation
typealias ManufacturerListResponse = ([Manufacturer]) -> Void

final class ManufacturersListViewModel {
    fileprivate let pageResults: Int
    fileprivate let useCasesLocator: UseCasesLocatorProtocol?
    fileprivate var maxNumOfPages = Int.max
    
    var onListDidChange: (() -> Void)? = nil
    var manufacturers: [Manufacturer]? = []
    var page: Int? {
        didSet {
            if page == 0 {
                self.manufacturers = []
            }
            
            guard page != oldValue else {
                return
            }
            updateManufacturers()
        }
    }
    var selectedManufacturer: Manufacturer?
    
    init(useCasesLocator: UseCasesLocatorProtocol = UseCasesLocator(), pageResults: Int = 15) {
        self.useCasesLocator = useCasesLocator
        self.pageResults = pageResults
    }
    
    func incrementPage() {
        guard let page = self.page, page < maxNumOfPages else { return }
        self.page = page + 1
    }
    
    func selectManufacturer(atIndex index: Int) {
        self.selectedManufacturer = self.manufacturers?[index]
    }
}

extension ManufacturersListViewModel {
    func updateManufacturers() {
        guard let locator = self.useCasesLocator,
            let useCase = locator.getUseCase(type: .manufacturersList) as? ManufacturersListImpl else {
                return
        }
        
        useCase.listManufacturers(page: (page ?? 0), results: pageResults) { [weak self] (response) in
            switch response {
            case .success(let newManufacturers):
                if !newManufacturers.isEmpty {
                    if self?.maxNumOfPages == Int.max, let totalPageCount = newManufacturers.first?.totalPageCount {
                        self?.maxNumOfPages = totalPageCount
                    }
                    self?.manufacturers?.append(contentsOf: newManufacturers)
                    self?.onListDidChange?()
                }
            case .noInternetConnection:
                print("No internet connection")
            case .failure:
                print("Error")
            }
        }
        
    }
}
