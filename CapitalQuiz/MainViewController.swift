//
//  ViewController.swift
//  CapitalQuiz
//
//  Created by Александр Умаров on 27.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var playerNameTextField: UITextField!
    @IBOutlet var startQuizButton: UIButton!
    @IBOutlet var leadersListButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
                NetworkManager.fetchData { countries in
                    GetData.shared.countries = countries
                }
        startQuizButton.layer.cornerRadius = 10
        leadersListButton.layer.cornerRadius = 10
    }
    @IBAction func unwind(for sugue: UIStoryboardSegue) {}

    @IBAction func startQuiz(_ sender: Any) {
        if playerNameTextField.text == nil || playerNameTextField.text == "" {
            nameAlert()
        } else {
            GetData.shared.playername = playerNameTextField.text
            playerNameTextField.text = nil
            performSegue(withIdentifier: "startQuiz", sender: nil)
        }
    }
    
}
extension MainViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

