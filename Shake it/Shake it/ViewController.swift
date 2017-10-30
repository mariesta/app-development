//
//  ViewController.swift
//  Shake it
//
//  Created by Marie Starck on 2017-10-30.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let songs = ["Light_of_the_Seven", "Dracarys", "The_Rains_of_Castamere"]
    var player: AVAudioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            let randomInt = Int(arc4random_uniform(3))
            let songName: String = songs[randomInt]
            do {
                
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: songName, ofType: "mp3")!))
                player.play()
            } catch {
                
                // It didn't work!
                
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

