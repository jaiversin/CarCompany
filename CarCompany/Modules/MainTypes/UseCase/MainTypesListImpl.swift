//
//  MainTypesListImpl.swift
//  CarCompany
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

struct MainTypesListImpl: UseCase {
    fileprivate let dataProvider: MainTypesListDataProviderProtocol?
    
    init(dataProvider: MainTypesListDataProviderProtocol? = MainTypesService()) {
        self.dataProvider = dataProvider
    }
}

extension MainTypesListImpl: MainTypesList {
    func listMainTypes(manufacturer: String, page: Int, results: Int, completion: @escaping (MainTypesResponse) -> Void) {
        self.dataProvider?.getMainTypes(manufacturer: manufacturer, page: page, results: results) { (response) in
            completion(response)
        }
    }
}
