//
//  ViewController.swift
//  Guessing Game
//
//  Created by Marie Starck on 2017-08-28.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userGuess: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func guess(_ sender: Any) {
        let diceRoll = String(arc4random_uniform(6))
        
        if userGuess.text == "" {
            resultLabel.text = "Please enter a number"
        } else if diceRoll == userGuess.text{
            resultLabel.text = "You are right!"
        } else {
            resultLabel.text = "You were wrong. It was \(diceRoll)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

