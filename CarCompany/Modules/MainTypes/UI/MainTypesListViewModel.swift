//
//  MainTypesListViewModel.swift
//  CarCompany
//
//  Created by Jhon on 4/20/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

final class MainTypesListViewModel {
    fileprivate let useCasesLocator: UseCasesLocatorProtocol?
    fileprivate var maxNumOfPages = Int.max
    let pageResults: Int
    let manufacturer: Manufacturer?
    var onListDidChange: (() -> Void)? = nil
    var mainTypes: [MainType]? = []
    
    var page: Int? {
        didSet {
            if page == 0 {
                self.mainTypes = []
            }
            
            guard page != oldValue else {
                return
            }
            updateMainTypes()
        }
    }
    
    init(useCasesLocator: UseCasesLocatorProtocol = UseCasesLocator(), manufacturer: Manufacturer, pageResults: Int = 15) {
        self.manufacturer = manufacturer
        self.useCasesLocator = useCasesLocator
        self.pageResults = pageResults
    }
    
    func incrementPage() {
        guard let page = self.page, (page + 1) < maxNumOfPages else { return }
        self.page = page + 1
    }
}

extension MainTypesListViewModel {
    func updateMainTypes() {
        guard let locator = self.useCasesLocator,
            let useCase = locator.getUseCase(type: .mainTypesList) as? MainTypesListImpl else {
                return
        }
        
        useCase.listMainTypes(manufacturer: (manufacturer?.id ?? ""), page: (page ?? 0), results: pageResults) { [weak self] (response) in
            switch response {
            case .success(let newMainTypes):
                if !newMainTypes.isEmpty {
                    if self?.maxNumOfPages == Int.max, let totalPageCount = newMainTypes.first?.totalPageCount {
                        self?.maxNumOfPages = totalPageCount
                    }
                    self?.mainTypes?.append(contentsOf: newMainTypes)
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
