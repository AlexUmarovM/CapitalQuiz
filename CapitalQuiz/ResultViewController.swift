//
//  ResultViewController.swift
//  CapitalQuiz
//
//  Created by Александр Умаров on 27.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var leadersButton: UIButton!
    var result: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetData.shared.playerResult = result
        resultLabel.text = result
        backButton.layer.cornerRadius = 10
        leadersButton.layer.cornerRadius = 10
    }
    
   
    @IBAction func getBack(_ sender: UIButton) {
        savePlayer()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func getLeadersList(_ sender: UIButton) {
        savePlayer()
    }

}
