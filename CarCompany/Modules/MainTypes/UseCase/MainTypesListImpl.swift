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
    
    init(dataProvider: MainTypesListDataProviderProtocol? = MainTypesListDataProvider()) {
        self.dataProvider = dataProvider
    }
}

extension MainTypesListImpl: MainTypesList {
    func listMainTypes(manufacturer: String, page: Int, results: Int) -> [MainType] {
        return self.dataProvider?.getMainTypes(manufacturer: manufacturer, page: page, results: results) ?? []
    }
}
