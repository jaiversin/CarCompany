//
//  MainTypesService.swift
//  CarCompany
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

class MainTypesService: MainTypesListDataProviderProtocol {
    func getMainTypes(manufacturer: String, page: Int, results: Int, completion: @escaping (MainTypesResponse) -> Void) {
        completion(.success(mainTypes: []))
    }
}
