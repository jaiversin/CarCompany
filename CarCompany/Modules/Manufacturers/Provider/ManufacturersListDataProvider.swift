//
//  ManufacturersListDataProvider.swift
//  CarCompany
//
//  Created by Jhon on 4/7/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

enum ManufacturersResponse {
    case failure
    case noInternetConnection
    case success(manufacturers: [Manufacturer])
}

protocol ManufacturersListDataProviderProtocol {
    func getManufacturers(forPage: Int, results: Int, completion: @escaping (ManufacturersResponse) -> Void)
}
