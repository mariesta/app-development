//
//  ViewController.swift
//  Navigation Bar
//
//  Created by Marie Starck on 2017-08-31.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var time = 0
    
    func result() {
        time = time + 1
        print ("\(time) seconds has passed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var timer = Timer()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

