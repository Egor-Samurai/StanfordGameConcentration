//
//  ViewController.swift
//  Concentration
//
//  Created by Егор on 07.02.2020.
//  Copyright © 2020 Egor Gurba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBAction func touchbutton(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
    }
    
    
    
    @IBAction func touchSecondButton(_ sender: UIButton) {
        flipCard(withEmoji: "🎃", on: sender)
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

