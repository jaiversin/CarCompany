//
//  ManufacturersListImpl.swift
//  CarCompany
//
//  Created by Jhon on 4/7/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

struct ManufacturersListImpl: UseCase {
    fileprivate let dataProvider: ManufacturersListDataProviderProtocol?
    
    init(dataProvider: ManufacturersListDataProviderProtocol? = ManufacturersListDataProvider()) {
        self.dataProvider = dataProvider
    }
}

// MARK: - ManufacturerList

extension ManufacturersListImpl: ManufacturerList {
    func listManufacturers(page: Int, results: Int) -> [Manufacturer] {
        return self.dataProvider?.getManufacturers(forPage: page, results: 15) ?? []
    }
}
