//
//  ViewController.swift
//  Timer App
//
//  Created by Marie Starck on 2017-10-18.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var seconds = 0
    var timer = Timer()
    var isRunning = false

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func refresh(_ sender: Any) {
        seconds = 0;
        timeLabel.text = "00:00:00"
    }
   
    @objc func result() {
        seconds += 1
        timeLabel.text = timeString(time: TimeInterval(seconds))
        
    }
    
    @objc func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }

    @IBAction func play(_ sender: Any) {
        if(!isRunning) {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.result), userInfo: nil, repeats: true)
            isRunning = true
        }
        
    }
    
    @IBAction func pause(_ sender: Any) {
        if(isRunning) {
            timer.invalidate()
            isRunning = false
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

