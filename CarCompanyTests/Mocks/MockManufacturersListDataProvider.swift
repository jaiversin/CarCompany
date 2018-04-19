//
//  MockManufacturersListDataProvider.swift
//  CarCompanyTests
//
//  Created by Jhon on 4/9/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation
@testable import CarCompany

class MockManufacturersListDataProvider: ManufacturersListDataProviderProtocol {
    private let totalPageCount = 5
    func getManufacturers(forPage page: Int, results: Int, completion: @escaping (ManufacturersResponse) -> Void) {
        guard page < totalPageCount else {
            completion(.success(manufacturers: []))
            return
        }
        
        let manufacturers = Array(self.manufacturers?[(page * results)...(((page + 1) * results) - 1)] ?? [])
        
        completion(.success(manufacturers: manufacturers))
    }
}

fileprivate extension MockManufacturersListDataProvider {
    var manufacturers: [Manufacturer]? {
        let manufacturersData = JsonUtils.loadJson(named: "manufacturers")
        let manufacturersDictionary = JsonUtils.jsonDictionary(with: manufacturersData)
        
        let manufacturers = manufacturersDictionary?.flatMap { (arg) -> Manufacturer? in
            let (key, value) = arg
            guard let id = Int(key as String), let name = value as? String else {
                return nil
            }
            return Manufacturer(id: id, name: name)
        }
        
        return manufacturers
    }
}
