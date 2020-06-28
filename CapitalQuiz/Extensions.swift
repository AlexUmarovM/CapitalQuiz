//
//  extensions.swift
//  CapitalQuiz
//
//  Created by Александр Умаров on 27.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit
extension QuizViewController {
    func getQuastionAnswer() -> String {
        let quastionCounty = countries.randomElement()!
        var allAswers: [String] = []
        quastionLabel.text = "What is a capital of \(quastionCounty.name!)"
        if quastionCounty.capital == "" {
            allAswers.append("Has no capital")
        } else {
            allAswers.append(quastionCounty.capital ?? "")
        }
        
        while allAswers.count != 4 {
            let randomAnswer = countries.randomElement()?.capital
            if randomAnswer == "" || allAswers.contains(randomAnswer!){
                continue
            } else {
                allAswers.append(randomAnswer ?? "")
            }
        }
        
        var shuffledAnswers = allAswers.shuffled()
        firstAswerButton.setTitle("\(String(describing: shuffledAnswers.first!))", for: .normal)
        shuffledAnswers.removeFirst()
        secondAswerButton.setTitle("\(String(describing: shuffledAnswers.first!))", for: .normal)
        shuffledAnswers.removeFirst()
        thirdAswerButton.setTitle("\(String(describing: shuffledAnswers.first!))", for: .normal)
        shuffledAnswers.removeFirst()
        fourthAswerButton.setTitle("\(String(describing: shuffledAnswers.first!))", for: .normal)
        shuffledAnswers.removeFirst()
        
        if answerCount == 10 {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        updateProgress()
        return quastionCounty.capital!
    }
    func updateProgress() {
        totalProgress = Float(answerCount) / 10
        quizProgressView.setProgress(totalProgress, animated: true)
    }
}

extension MainViewController {
    func nameAlert() {
        let alert = UIAlertController (title: "Oops!",
                                       message: "Enter Correct Name",
                                       preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ResultViewController {
    func savePlayer() {
        guard let playerName = GetData.shared.playername else { return }
        guard let playerResult = GetData.shared.playerResult else { return }
        let player = Player(playerName: playerName, playerResult: playerResult)
        StorageManager.shared.savePlayerToFile(with: player)
    }
}
