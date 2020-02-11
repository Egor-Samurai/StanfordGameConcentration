//
//  ViewController.swift
//  Concentration
//
//  Created by Егор on 07.02.2020.
//  Copyright © 2020 Egor Gurba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
  private  lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards : Int {
        return (cardButtons.count + 1) / 2 
    }
    
private(set)  var flipCount = 0 {
        didSet {
            flipLabelCount.text = "Flips: \(flipCount)"
        }
    }
    
    
    
    @IBOutlet private weak var flipLabelCount: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchbutton(_ sender: UIButton) {
        flipCount += 1
        if  let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        
    }
    
 private   func updateViewFromModel() {
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

  private  var emojiChoice = ["😈","👻","💩","🎃","👽","🖕","😼","👺","💀"]
    
  private  var emoji = [Int:String]()
  private  func emoji(for card: Card) -> String  {
        if emoji[card.identifier] == nil , emojiChoice.count > 0 {
            emoji[card.identifier] = emojiChoice.remove(at: emojiChoice.count.arc4random)
        }
      return emoji[card.identifier] ?? "?"
        
    }

}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
    
}
