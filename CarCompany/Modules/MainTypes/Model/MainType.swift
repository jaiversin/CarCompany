//
//  MainType.swift
//  CarCompany
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

struct MainType {
    let name: String
    var totalPageCount: Int = Int.max
    
    init(name: String, totalPageCount: Int = Int.max) {
        self.name = name
        self.totalPageCount = totalPageCount
    }
}

extension MainType: Equatable {
    static func ==(lhs: MainType, rhs: MainType) -> Bool {
        return lhs.name == rhs.name
    }
}
