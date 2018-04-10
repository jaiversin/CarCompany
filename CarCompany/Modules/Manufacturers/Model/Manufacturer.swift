//
//  Manufacturer.swift
//  CarCompany
//
//  Created by Jhon on 4/5/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

struct Manufacturer {
    let id: Int
    let name: String
}

extension Manufacturer: Equatable {
    static func ==(lhs: Manufacturer, rhs: Manufacturer) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}
