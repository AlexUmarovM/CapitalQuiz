//
//  StorageManager.swift
//  CapitalQuiz
//
//  Created by Александр Умаров on 28.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import Foundation
class StorageManager {
    
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let playerKey = "players"
    private let documentsDirecory = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask).first!
    private var archiveURL: URL!
    
    private init() {
        archiveURL = documentsDirecory.appendingPathComponent("player").appendingPathExtension("plist")
    }
    
    func savePlayer(with player: Player) {
        var players = fetchPlayers()
        players.append(player)
        guard let data = try? JSONEncoder().encode(players) else { return }
        userDefaults.set(data, forKey: playerKey)
    }
    
    func savePlayerToFile(with player: Player) {
        var players = fetchPlayersFromFile()
        players.append(player)
        guard let data = try? PropertyListEncoder().encode(players) else { return }
        try? data.write(to: archiveURL, options: .noFileProtection)
    }
    
    func fetchPlayers() -> [Player] {
        guard let data = userDefaults.object(forKey: playerKey) as? Data else { return [] }
        guard let players = try? JSONDecoder().decode([Player].self, from: data) else { return [] }
        return players
    }
    
    func fetchPlayersFromFile() -> [Player] {
        guard let data = try? Data(contentsOf: archiveURL) else { return [] }
        guard let players = try? PropertyListDecoder().decode([Player].self, from: data) else { return [] }
        return players
    }
}
