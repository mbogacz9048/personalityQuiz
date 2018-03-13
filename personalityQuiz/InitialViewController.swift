//
//  ViewController.swift
//  personalityQuiz
//
//  Created by Matt Bogacz on 2/28/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func beginButtonPushed(_ sender: UIButton) {
        performSegue(withIdentifier: "initialSegue", sender: nil)
    }
}

