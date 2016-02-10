//
//  ViewController.swift
//  Hello World
//
//  Created by Marie Starck on 2016-01-13.
//  Copyright © 2016 Marie Starck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var catAge: UITextField!
    
    @IBOutlet weak var result: UILabel!

    @IBAction func findAge(sender: AnyObject) {
        
        var catAgeResult = Int(catAge.text!)!
        
        catAgeResult = catAgeResult * 7
        
        result.text = "Your cat is \(catAgeResult) in cat years"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

