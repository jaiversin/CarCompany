//
//  MainTypesListDataProvider.swift
//  CarCompany
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

enum MainTypesResponse {
    case failure
    case noInternetConnection
    case success(mainTypes: [MainType])
}

protocol MainTypesListDataProviderProtocol {
    func getMainTypes(manufacturer: String, page: Int, results: Int, completion: @escaping (MainTypesResponse) -> Void)
}
