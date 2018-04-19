//
//  ManufacturersService.swift
//  CarCompany
//
//  Created by Jhon on 4/11/18.
//  Copyright © 2018 Jhon Jaiver López. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String:Any]

final class ManufacturersService {
    fileprivate struct Constants {
        static let waKey = "coding-puzzle-client-449cc9d"
        static let endpoint = "http://api-aws-eu-qa-1.auto1-test.com/v1/car-types/manufacturer?page=%d&pageSize=%d&wa_key=%@"
    }
}

extension ManufacturersService: ManufacturersListDataProviderProtocol {
    func getManufacturers(forPage: Int, results: Int, completion: @escaping (ManufacturersResponse) -> Void) {
        assert(!type(of: self).Constants.endpoint.isEmpty, "Please fulfill the endpont and waKey before running")
        
        Alamofire.request(type(of: self).makeEndoint(forPage: forPage, results: results)).responseJSON { (response) in
            
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
                    let manufacturers = type(of: self).parse(response: json) {
                    completion(.success(manufacturers: manufacturers))
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

extension ManufacturersService {
    static func makeEndoint(forPage page: Int, results: Int) -> String {
        return String(format: self.Constants.endpoint, page, 15, self.Constants.waKey)
    }
    
    static func parse(response: JSON) -> [Manufacturer]? {
        guard let resultsDictionary = response["wkda"] as? [String: Any],
            let totalPageCount = response["totalPageCount"] as? Int else {
            return []
        }
        
        let manufacturers = resultsDictionary.flatMap { (arg) -> Manufacturer? in
            let (key, value) = arg
            guard let id = Int(key as String),
                let name = value as? String else {
                return nil
            }
            return Manufacturer(id: id, name: name, totalPageCount: totalPageCount)
        }
        
        return manufacturers
    }
}
