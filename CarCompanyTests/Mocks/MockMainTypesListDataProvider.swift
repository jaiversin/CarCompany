//
//  MockMainTypesListDataProvider.swift
//  CarCompanyTests
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation
@testable import CarCompany

class MockMainTypesListDataProvider: MainTypesListDataProviderProtocol {
    private let totalPageCount = 2
    func getMainTypes(manufacturer: String, page: Int, results: Int, completion: @escaping (MainTypesResponse) -> Void) {
        guard page < totalPageCount, manufacturer == "720" else { //Fulfilling requirement for empty result on non existent manufacturer
            completion(.success(mainTypes: []))
            return 
        }
        
        let manufacturers = Array(self.mainTypes?[(page * results)...(results - 1)] ?? [])
        
        completion(.success(mainTypes: manufacturers))
    }
}

extension MockMainTypesListDataProvider {
    var mainTypes: [MainType]? {
        let mainTypesData = JsonUtils.loadJson(named: "mainTypesRenault")
        let mainTypesDictionary = JsonUtils.jsonDictionary(with: mainTypesData)
        
        let mainTypes = mainTypesDictionary?.values.flatMap { (name) -> MainType? in
            guard let name = name as? String else {
                return nil
            }
            return MainType(name: name)
        }
        
        return mainTypes
    }
}
