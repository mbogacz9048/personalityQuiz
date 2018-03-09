//
//  QuestionsViewController.swift
//  personalityQuiz
//
//  Created by Matt Bogacz on 3/7/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var singleStackb1: UIButton!
    @IBOutlet weak var singleStackb2: UIButton!
    @IBOutlet weak var singleStackb3: UIButton!
    @IBOutlet weak var multipleLabel2: UILabel!
    @IBOutlet weak var multipleLabel1: UILabel!
    @IBOutlet weak var RangedLabel2: UILabel!
    @IBOutlet weak var RangedLabel1: UILabel!
    @IBOutlet weak var MultipleSwitch4: UISwitch!
    @IBOutlet weak var multipleLabel4: UILabel!
    @IBOutlet weak var MultipleSwitch3: UISwitch!
    @IBOutlet weak var MultipleLabel3: UILabel!
    @IBOutlet weak var multipleSwitch2: UISwitch!
    @IBOutlet weak var multipleSwitch1: UISwitch!    
    @IBOutlet weak var singleStackb4: UIButton!
    
    
    
    var questionsIndex = 0
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
    
    ]),
        
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
    
    ]),
        Question(text: "Which activities do you enjoy?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get a little nervous", type: .rabbit),
                    Answer(text: "I barely notice them", type: .turtle),
                    Answer(text: "I love them", type: .dog)
    ])
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionsIndex]
        let currentAnswers = currentQuestion.answers
        
        let totalProgress = Float(questionsIndex)/Float(questions.count)
        
        navigationItem.title = "Questions #\(questionsIndex + 1)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(totalProgress, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
