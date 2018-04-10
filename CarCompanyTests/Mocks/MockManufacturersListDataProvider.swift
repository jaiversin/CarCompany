//
//  MockManufacturersListDataProvider.swift
//  CarCompanyTests
//
//  Created by Jhon on 4/9/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation
@testable import CarCompany

class MockManufacturersListDataProvider: ManufacturersListDataProviderProtocol {
    private let totalPageCount = 5
    
    func getManufacturers(forPage page: Int, results: Int) -> [Manufacturer] {
        guard page < 5 else {
            return []
        }
        
        let manufacturers = self.manufacturers ?? []
        
        return manufacturers
    }
}

fileprivate extension MockManufacturersListDataProvider {
    var manufacturers: [Manufacturer]? {
        let manufacturersData = loadManufacturersJson()
        let manufacturersDictionary = jsonDictionary(with: manufacturersData)
        
        let manufacturers = manufacturersDictionary?.flatMap { (arg) -> Manufacturer? in
            let (key, value) = arg
            guard let id = Int(key as String), let name = value as? String else {
                return nil
            }
            return Manufacturer(id: id, name: name)
        }
        
        return manufacturers
    }
    
    func jsonDictionary(with data: Data?) -> [String: Any]? {
        do {
            guard let data = data,
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                let manufacturersDictionary = json["wkda"] as? [String: Any] else {
                    return nil
            }
            
            return manufacturersDictionary
        } catch {
            print("Couldn't parse JSON. Error: \(error)")
        }
        return nil
    }
    
    func loadManufacturersJson() -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let path = bundle.path(forResource: "manufacturers", ofType: "json") else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["wkda"] as? [Any] {
                
            }
        } catch {
            return nil
        }
    }
}

/*
 {
 "page": 0,
 "pageSize": 80,
 "totalPageCount": 1,
 "wkda": {
 "107": "Bentley",
 "130": "BMW",
 "141": "Buick",
 "145": "Brilliance",
 "150": "Cadillac",
 "157": "Caterham",
 "160": "Chevrolet",
 "170": "Chrysler",
 "190": "Citroen",
 "191": "Corvette",
 "194": "Dacia",
 "195": "Daewoo",
 "210": "Daihatsu",
 "225": "Nissan",
 "230": "Dodge",
 "277": "Ferrari",
 "280": "Fiat",
 "285": "Ford",
 "315": "Hummer",
 "340": "Honda",
 "345": "Hyundai",
 "357": "Infiniti",
 "362": "Isuzu",
 "365": "Iveco",
 "380": "Jaguar",
 "390": "Jeep",
 "425": "Kia",
 "460": "Lada",
 "465": "Lamborghini",
 "470": "Lancia",
 "487": "Lexus",
 "502": "Lotus",
 "520": "MAN",
 "522": "Maserati",
 "530": "Maybach",
 "550": "Mazda",
 "560": "Smart",
 "570": "Mercedes-Benz",
 "580": "MINI",
 "590": "Mitsubishi",
 "650": "Opel",
 "670": "Peugeot",
 "700": "Pontiac",
 "710": "Porsche",
 "715": "Proton",
 "720": "Renault",
 "727": "Rolls Royce",
 "730": "Land Rover",
 "740": "Saab",
 "790": "Seat",
 "800": "Skoda",
 "810": "Ssangyong",
 "820": "Subaru",
 "830": "Suzuki",
 "850": "Tata",
 "853": "Tesla",
 "860": "Toyota",
 "865": "Trabant",
 "895": "Piaggio (Vespa)",
 "905": "Volkswagen",
 "910": "Volvo",
 "930": "Wartburg",
 "935": "Westfield",
 "960": "Zastava",
 "020": "Abarth",
 "040": "Alfa Romeo",
 "042": "Alpina",
 "057": "Aston Martin",
 "060": "Audi",
 "095": "Barkas",
 "070": "MG Rover"
 }
 }
*/
