//
//  MainTypesList.swift
//  CarCompany
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

protocol MainTypesList {
    func listMainTypes(manufacturer: String, page: Int, results: Int, completion: @escaping (MainTypesResponse) -> Void)
}
