//
//  DataManager.swift
//  CapitalQuiz
//
//  Created by Александр Умаров on 28.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import Foundation
class GetData {
    static let shared = GetData()
    var countries: [Country] = []
    var playername: String?
    var playerResult: String?
}
