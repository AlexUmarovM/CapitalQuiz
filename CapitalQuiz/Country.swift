//
//  Country.swift
//  CapitalQuiz
//
//  Created by Александр Умаров on 27.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

struct Country {
    var name: String?
    var capital: String?
    
    init(item: [String: Any]) {
           name = item["name"] as? String
           capital = item["capital"] as? String
       }
       
       static func getArray(from arrayOfItems: Any) -> [Country]? {
           guard let arrayOfItems = arrayOfItems as? Array<[String: Any]> else { return nil }
           return arrayOfItems.compactMap { Country(item: $0) }
       }
}
