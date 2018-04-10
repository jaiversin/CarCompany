//
//  ManufacturersListDataProvider.swift
//  CarCompany
//
//  Created by Jhon on 4/7/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

struct ManufacturersListDataProvider: ManufacturersListDataProviderProtocol {
    func getManufacturers(forPage: Int, results: Int) -> [Manufacturer] {
        return []
    }
}

protocol ManufacturersListDataProviderProtocol {
    func getManufacturers(forPage: Int, results: Int) -> [Manufacturer]
}
