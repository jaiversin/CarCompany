//
//  UseCasesLocator.swift
//  CarCompany
//
//  Created by Jhon on 4/7/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

enum UseCaseType {
    case manufacturersList
    case mainTypesList
}

protocol UseCase {
    
}

protocol UseCasesLocatorProtocol {
    func getUseCase(type: UseCaseType) -> UseCase?
}

struct UseCasesLocator: UseCasesLocatorProtocol {
    func getUseCase(type: UseCaseType) -> UseCase? {
        switch type {
        case .manufacturersList:
            return ManufacturersListImpl()
        case .mainTypesList:
            return MainTypesListImpl()
        }
    }
}
