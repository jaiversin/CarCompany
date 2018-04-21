//
//  MainTypesService.swift
//  CarCompany
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation
import Alamofire

class MainTypesService: MainTypesListDataProviderProtocol {
    fileprivate struct Constants {
        static let waKey = ""
        static let endpoint = ""
    }
}

extension MainTypesService {
    func getMainTypes(manufacturer: String, page: Int, results: Int, completion: @escaping (MainTypesResponse) -> Void) {
        assert(!type(of: self).Constants.endpoint.isEmpty, "Please fulfill the endpont and waKey before running")
        
        Alamofire.request(type(of: self).makeEndoint(forPage: page, results: results, manufacturer: manufacturer)).responseJSON { (response) in
            
            guard let urlResponse = response.response else {
                if let error = response.result.error as NSError?,
                    error.code == NSURLErrorNotConnectedToInternet {
                    completion(.noInternetConnection)
                } else {
                    completion(.failure)
                }
                return
            }
            
            switch urlResponse.statusCode {
            case 200:
                if let json = response.result.value as? JSON,
                    let mainTypes = type(of: self).parse(response: json) {
                    completion(.success(mainTypes: mainTypes))
                } else {
                    completion(.failure)
                }
            case NSURLErrorNotConnectedToInternet:
                completion(.noInternetConnection)
            default:
                completion(.failure)
            }
        }
    }
}

extension MainTypesService {
    static func makeEndoint(forPage page: Int, results: Int, manufacturer: String) -> String {
        return String(format: self.Constants.endpoint, page, 15, manufacturer, self.Constants.waKey)
    }
    
    static func parse(response: JSON) -> [MainType]? {
        guard let resultsDictionary = response["wkda"] as? [String: Any],
            let totalPageCount = response["totalPageCount"] as? Int else {
            return []
        }
        
        let mainTypes = resultsDictionary.values.flatMap { (name) -> MainType? in
            
            guard let name = name as? String else {
                return nil
            }
            return MainType(name: name, totalPageCount: totalPageCount)
        }
        
        return mainTypes
    }
}
