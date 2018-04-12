//
//  MainTypesListDataProvider.swift
//  CarCompany
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

struct MainTypesListDataProvider: MainTypesListDataProviderProtocol {
    func getMainTypes(manufacturer: String, page: Int, results: Int) -> [MainType] {
        return []
    }
    
    
}

protocol MainTypesListDataProviderProtocol {
    func getMainTypes(manufacturer: String, page: Int, results: Int) -> [MainType]
}
