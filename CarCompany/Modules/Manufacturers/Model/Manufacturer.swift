//
//  Manufacturer.swift
//  CarCompany
//
//  Created by Jhon on 4/5/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

struct Manufacturer {
    let id: String
    let name: String
    var totalPageCount: Int = Int.max
    
    init(id: String, name: String, totalPageCount: Int = Int.max) {
        self.id = id
        self.name = name
        self.totalPageCount = totalPageCount
    }
}

extension Manufacturer: Equatable {
    static func ==(lhs: Manufacturer, rhs: Manufacturer) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}
