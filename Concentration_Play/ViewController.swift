//
//  ViewController.swift
//  Concentration_Play
//
//  Created by Ibrahim Attalla on 8/22/18.
//  Copyright © 2018 Ibrahim_Attalla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // array of buttons to get the index of it and pase it to array of emojis
    @IBOutlet var cardButtons: [UIButton]!
    var twoCarBTn:[UIButton]!
    // array of emojis
    var emojis = ["👻","🦅","🐳","🎃","🤖","👻","🦅","🐳","🍄","🤖","🍄","🎃"]
   
    var flipCount = 0 {
        // properety Observing .. at eny changs allover the code
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var flipSCount = 0
    var fristBtn = 0
    var lastBtn = 0
    
    @IBOutlet weak var flipCountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func touchCardBTN(_ sender: UIButton) {
        flipCount += 1
        
        let cardNumber = cardButtons.index(of: sender)!
      

        //to get the index of it and pass it to array of emojis
        print("card Number = \(cardNumber)")
        flipCard(withEmoji: emojis[cardNumber], on: sender)
        
        print("flipsCount : \(flipSCount)")
        
        flipSCount += 1
        
        if flipSCount == 1 {
            fristBtn = cardNumber
        }
        if flipSCount == 2 {
            lastBtn = cardNumber
            if emojis[fristBtn] == emojis[lastBtn]{
                cardButtons[fristBtn].isEnabled = false
                cardButtons[lastBtn].isEnabled = false
                flipSCount = 0

            }else{
                flipToHide()

            }
        }
    }
    
    func flipCard(withEmoji emoji:String , on button : UIButton){
        if button.currentTitle == emoji{
            
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            UIView.transition(with: button, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: nil)
            
        }else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            UIView.transition(with: button, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)

        }
    }
    
    func flipToHide (){
        
        flipSCount = 0

        cardButtons[fristBtn].setTitle("", for:  UIControlState.normal)
        cardButtons[fristBtn].backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        
        cardButtons[lastBtn].setTitle("", for:  UIControlState.normal)
        cardButtons[lastBtn].backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        
        UIView.transition(with:cardButtons[lastBtn], duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: nil)
          }
    }

