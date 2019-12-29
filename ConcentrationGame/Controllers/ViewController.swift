//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Oriontek on 12/9/19.
//  Copyright © 2019 JoelsTeam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2)
    var emojiChoices = ["🎃","👻","🎃","👻"]
    var flipCount: Int = 0 {
        didSet {
             flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func flipCard(_ sender: UIButton) {
        notifyFlip()
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            game.chooseCard(withIndex: cardIndex)
            updateViewFromModel()
        }else {
            print("Choosen card is not in the cards deck.")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                flipCard(withTitle: emoji(for: card),for: button)
            } else {
                flipCard(withTitle: emoji(for: card),for: button)
            }
        }
    }
    
    private func notifyFlip(){
        flipCount += 1
    }
    
    private func emoji(for card: Card) -> String {
        return card.isMatched ? "clear" : "👻"
    }
    
    private func flipCard(withTitle emoji: String = "",for button: UIButton ){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = (emoji == "clear") ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9549939036, green: 0.1228163317, blue: 0, alpha: 1)
        }
        notifyFlip()
    }
    

}

