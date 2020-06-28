//
//  NetworkManager.swift
//  CapitalQuiz
//
//  Created by Александр Умаров on 27.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import Alamofire
class NetworkManager {
    
    static private let jsonUrl = "https://restcountries.eu/rest/v2/all"
    
    static func fetchData(completion: @escaping ([Country]) -> ()) {
        
        AF.request(jsonUrl).validate().responseJSON { jsonData in
            
            switch jsonData.result {
                
            case .success(let value):
                let countries = Country.getArray(from: value)
                
                DispatchQueue.main.async {
                    completion(countries ?? [])
                }
                
            case .failure(let error ): print(error)
            }
        }
    }
}
