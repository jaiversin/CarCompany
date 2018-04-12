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
}

extension MainType: Equatable {
    static func ==(lhs: MainType, rhs: MainType) -> Bool {
        return lhs.name == rhs.name
    }
}
