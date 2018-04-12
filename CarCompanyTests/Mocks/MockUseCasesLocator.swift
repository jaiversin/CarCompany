//
//  MockUseCasesLocator.swift
//  CarCompanyTests
//
//  Created by Jhon on 4/12/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation
@testable import CarCompany

class MockUseCasesLocator: UseCasesLocatorProtocol {
    static func getUseCase(type: UseCaseType) -> UseCase? {
        switch type {
        case .manufacturersList:
            return ManufacturersListImpl(dataProvider: MockManufacturersListDataProvider())
        case .mainTypesList:
            return MainTypesListImpl(dataProvider: MockMainTypesListDataProvider())
        }
    }
}
