//
//  JsonUtils.swift
//  CarCompanyTests
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation

class JsonUtils {
    static func jsonDictionary(with data: Data?) -> [String: Any]? {
        do {
            guard let data = data,
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                let resultsDictionary = json["wkda"] as? [String: Any] else {
                    return nil
            }
            
            return resultsDictionary
        } catch {
            print("Couldn't parse JSON. Error: \(error)")
        }
        return nil
    }
    
    static func loadJson(named fileName: String) -> Data? {
        let bundle = Bundle(for: JsonUtils.self)
        guard let path = bundle.path(forResource: fileName, ofType: "json") else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
        } catch {
            return nil
        }
    }
}
