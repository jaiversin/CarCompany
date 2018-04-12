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
    fileprivate let useCasesLocator: UseCasesLocatorProtocol?
    
    init(useCasesLocator: UseCasesLocatorProtocol) {
        self.useCasesLocator = useCasesLocator
    }
}

extension ManufacturersListViewModel {
    func getManufacturers(completion: ManufacturerListResponse) {
        guard let locator = self.useCasesLocator,
            let useCase = locator.getUseCase(type: .manufacturersList) as? ManufacturersListImpl else {
                return
        }
        
        useCase.listManufacturers(page: 0, results: 15) { (response) in
            
        }
        
    }
}
