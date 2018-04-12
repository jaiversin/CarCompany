//
//  ManufacturersService.swift
//  CarCompany
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

final class ManufacturersService: ManufacturersListDataProviderProtocol {
    func getManufacturers(forPage: Int, results: Int, completion: @escaping (ManufacturersResponse) -> Void) {
        completion(.success(manufacturers: []))
    }
}

extension ManufacturersService {
    
}
