//
//  LeadersListTableViewController.swift
//  CapitalQuiz
//
//  Created by Александр Умаров on 27.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit

class LeadersListTableViewController: UITableViewController {
    
    var players: [Player] = []
    @IBOutlet var backButton: UIBarButtonItem!
    @IBAction func unwind(for sugue: UIStoryboardSegue) {}
    override func viewDidLoad() {
        super.viewDidLoad()
        players = StorageManager.shared.fetchPlayersFromFile()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "player", for: indexPath)
        let player = players[indexPath.row]
        cell.textLabel?.text = player.playerName
        cell.detailTextLabel?.text = player.playerResult
        return cell
    }
    
    @IBAction func getBack(_ sender: UIBarButtonItem) {
    }
    
}
