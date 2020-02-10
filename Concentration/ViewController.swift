//
//  ViewController.swift
//  Concentration
//
//  Created by Егор on 07.02.2020.
//  Copyright © 2020 Egor Gurba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
   lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipLabelCount.text = "Flips: \(flipCount)"
        }
    }
    
    
    
    @IBOutlet weak var flipLabelCount: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchbutton(_ sender: UIButton) {
        flipCount += 1
        if  let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        } else {
            print("choosen card was not in cardButtons")
        }
        
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for : card), for: UIControl.State.normal)
                 button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }

    var emojiChoice = ["😈","👻","💩","🎃","👽","🖕","😼","👺","💀"]
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String  {
        if emoji[card.identifier] == nil , emojiChoice.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
            emoji[card.identifier] = emojiChoice.remove(at: randomIndex)
        }
      return emoji[card.identifier] ?? "?"
        
    }

}

