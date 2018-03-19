//
//  ResultsViewController.swift
//  personalityQuiz
//
//  Created by Matt Bogacz on 3/7/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]!

    @IBOutlet weak var resultsAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinition: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()

        // Do any additional setup after loading the view.
    }
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map {$0.type}
        for responses in responseTypes {
            frequencyOfAnswers[responses] = (frequencyOfAnswers[responses] ?? 0) + 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted {$0.1 > $1.1 }.first?.key
        resultsAnswerLabel.text = "you are a \(mostCommonAnswer?.rawValue)"
        resultDefinition.text = mostCommonAnswer?.definition
    }
 
}
