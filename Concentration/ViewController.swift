//
//  ViewController.swift
//  Concentration
//
//  Created by Егор on 07.02.2020.
//  Copyright © 2020 Egor Gurba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0 {
        didSet {
            flipLabelCount.text = "Flips: \(flipCount)"
        }
    }
    
   var emojiChoice = ["🎃","👻","🎃","👻"]
    
    
    @IBOutlet weak var flipLabelCount: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchbutton(_ sender: UIButton) {
        flipCount += 1
        if  let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
        } else {
            print("choosen card was not in cardButtons")
        }
        
    }
    
    
    
    func flipCard(withEmoji emoji:String, on button:UIButton){
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

}

