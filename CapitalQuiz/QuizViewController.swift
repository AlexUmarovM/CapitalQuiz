//
//  QuizViewController.swift
//  CapitalQuiz
//
//  Created by Александр Умаров on 27.06.2020.
//  Copyright © 2020 Александр Умаров. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet var quizProgressView: UIProgressView!
    @IBOutlet var quastionLabel: UILabel!
    
    @IBOutlet var firstAswerButton: UIButton!
    @IBOutlet var secondAswerButton: UIButton!
    @IBOutlet var thirdAswerButton: UIButton!
    @IBOutlet var fourthAswerButton: UIButton!
    
    var countries: [Country] = []
    var rightAnswer = 0
    var wrongAnswer = 0
    var answerCount = 0
    var answer = ""
    var totalProgress:Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries = GetData.shared.countries
        answer = getQuastionAnswer()
        firstAswerButton.layer.cornerRadius = 10
        secondAswerButton.layer.cornerRadius = 10
        thirdAswerButton.layer.cornerRadius = 10
        fourthAswerButton.layer.cornerRadius = 10
    }
    
    @IBAction func stopQuizButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func firstButtonPressed(_ sender: UIButton) {
        if firstAswerButton.titleLabel?.text == answer {
            rightAnswer += 1
        } else {
            wrongAnswer += 1
        }
        answerCount += 1
        answer = getQuastionAnswer()
    }
    
    @IBAction func secondButtonPressed(_ sender: UIButton) {
        if secondAswerButton.titleLabel?.text == answer {
            rightAnswer += 1
        } else {
            wrongAnswer += 1
        }
        answerCount += 1
        answer = getQuastionAnswer()
    }
    
    @IBAction func thirdButtonPressed(_ sender: UIButton) {
        if thirdAswerButton.titleLabel?.text == answer {
            rightAnswer += 1
        } else {
            wrongAnswer += 1
        }
        answerCount += 1
        answer = getQuastionAnswer()
    }
    
    @IBAction func fourthButtonPressed(_ sender: UIButton) {
        if fourthAswerButton.titleLabel?.text == answer {
            rightAnswer += 1
        } else {
            wrongAnswer += 1
        }
        answerCount += 1
        answer = getQuastionAnswer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as? ResultViewController
        if segue.identifier == "resultSegue"{
            resultVC?.result = "Your result is \(rightAnswer)/10"
        }
    }
}
