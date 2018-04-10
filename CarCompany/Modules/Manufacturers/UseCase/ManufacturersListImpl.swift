//
//  ManufacturersListImpl.swift
//  CarCompany
//
//  Created by Jhon on 4/7/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

struct ManufacturersListImpl: UseCase {
    var dataProvider: ManufacturersListDataProviderProtocol?
    
    init(dataProvider: ManufacturersListDataProviderProtocol?) {
        self.dataProvider = dataProvider
    }
}

// MARK: - ManufacturerList

extension ManufacturersListImpl: ManufacturerList {
    func listManufacturers(page: Int, results: Int) -> [Manufacturer] {
        return []
    }
}
