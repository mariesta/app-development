//
//  ViewController.swift
//  TicTacToe
//
//  Created by Marie Starck on 2017-10-28.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // 1 = nought and 2 = cross
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gameState = [Int](repeating: 0, count: 9)
    
    var gameActive = true
    
    @IBOutlet weak var GameOverLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    // Reset everything
    @IBAction func playAgain(_ sender: UIButton) {
        activePlayer = 1
        gameActive = true
        gameState = [Int](repeating: 0, count: 9)
        
        // Set everything button back to the no-image and therefore blank
        for index in 1...9 {
            
            let buttonToClear = self.view.viewWithTag(index) as! UIButton
            
            buttonToClear.setImage(nil, for: UIControlState.normal)
            
        }

        GameOverLabel.isHidden = true
        playAgainButton.isHidden = true
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        // All the tags were set from 1...9 because default tag is 0 but in arrays, it goes 0...8
        // so we are compensating by doing a -1
        let index = sender.tag - 1
        if (gameState[index] == 0 && gameActive == true) {
            gameState[index] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: UIControlState.normal)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: UIControlState.normal)
                activePlayer = 1
            }
            
            for combination in winningCombinations {
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    gameActive = false
                    GameOverLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        GameOverLabel.text = "Noughts have won!"
                        
                    } else {
                        
                        GameOverLabel.text = "Crosses have won!"
                        
                    }
                }
                
            }

            // A winning combination hasn't been found.
            // Could it be a draw?
            if gameActive == true {
                
                // Assume the game has ended and sets it back to true if blank spots are found
                gameActive = false
                for buttonState in gameState {
                    if buttonState == 0 {
                        gameActive = true
                    }
                    
                }

                // We didn't find a blank spot
                if gameActive == false {
                    GameOverLabel.text = "It's a draw!"
                    GameOverLabel.isHidden = false
                    playAgainButton.isHidden = false
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playAgainButton.isHidden = true
        GameOverLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

