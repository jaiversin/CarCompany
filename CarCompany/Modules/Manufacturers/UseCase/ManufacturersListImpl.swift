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
    
    init(dataProvider: ManufacturersListDataProviderProtocol? = ManufacturersService()) {
        self.dataProvider = dataProvider
    }
}

// MARK: - ManufacturerList

extension ManufacturersListImpl: ManufacturerList {
    func listManufacturers(page: Int, results: Int, completion: @escaping (ManufacturersResponse) -> Void) {
        self.dataProvider?.getManufacturers(forPage: page, results: results) { (response) in
            completion(response)
        }
    }
}
