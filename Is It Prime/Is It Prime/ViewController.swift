//
//  ViewController.swift
//  Is It Prime
//
//  Created by Marie Starck on 2017-08-31.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userAnswer: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func isPrime(_ sender: Any) {
        if let n = Int(userAnswer.text!) {
            var isPrimeNumber = true
            if n <= 1 {
                isPrimeNumber = false
            } else if n <= 3 {
                isPrimeNumber = true
            } else if n % 2 == 0 || n % 3 == 0{
                isPrimeNumber = false
            }
            
            var i = 5
            while i * i <= n {
                if n % i == 0 || n % (i+2) == 0 {
                    isPrimeNumber = false
                }
                i = i + 6
            }
            
            if isPrimeNumber {
                resultLabel.text = "It is a prime number"
            } else {
                resultLabel.text = "It is not a prime number"
            }
        } else {
            resultLabel.text = "Please enter a whole number"
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

