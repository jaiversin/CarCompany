//
//  ManufacturersList.swift
//  CarCompany
//
//  Created by Jhon on 4/5/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

protocol ManufacturerList {
    func listManufacturers(page: Int, results: Int, completion: @escaping (ManufacturersResponse) -> Void)
}
