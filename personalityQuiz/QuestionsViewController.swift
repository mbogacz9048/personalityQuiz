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
    @IBOutlet weak var RangeSlider: UISlider!
    
    
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
        updateUI()

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
        
        
        
        switch currentQuestion.type {
        case .single :
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        
        }
        
    }
    func nextQuestion() {
        questionsIndex += 1
        if questionsIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleStackb1.setTitle(answers[0].text, for: .normal)
        singleStackb2.setTitle(answers[1].text, for: .normal)
        singleStackb3.setTitle(answers[2].text, for: .normal)
        singleStackb4.setTitle(answers[3].text, for: .normal)
    }

    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        MultipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
    }
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        RangedLabel1.text = answers.first?.text
        RangedLabel2.text = answers.last?.text
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
