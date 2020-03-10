//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Oriontek on 12/9/19.
//  Copyright © 2019 JoelsTeam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // Atributes
    lazy var pairsOfCards = (cardButtons.count + 1) / 2
    private lazy var game = Concentration(numberOfPairsOfCard: pairsOfCards)
    private var emojiChoices: [String] = []
    var themeName: String? {
        didSet {
            updateViewFromModel()
        }
    }
    private let viewModel = ConcentrationGameViewModel()
    private var emojisForCardIndex = [Int:String]()
    
    // Views
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    // Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if themeName == nil { themeName = "Halloween" }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emojiChoices = viewModel.getEmojiesForThemeWith(name: themeName!)
    }
    
    @IBAction private func flipCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            game.chooseCard(withIndex: cardIndex)
            updateViewFromModel()
        }else {
            print("Choosen card is not in the cards deck.")
        }
    }
    
    @IBAction func newGame(_ sender: Any) {
        game = Concentration(numberOfPairsOfCard: pairsOfCards)
        updateViewFromModel()
    }
    
    private func updateViewForCardWith(index : Int) {
        let card = game.cards[index]
        if card.isFaceUp {
            flipCard(withTitle: emoji(for: card), for: index)
        }else {
            flipCard(for: index)
        }
    }
    
    private func updateViewFromModel() {
        if cardButtons != nil {
            for index in cardButtons.indices {
                updateViewForCardWith(index: index)
            }
            flipCountLabel.text = "Flips: \(game.flipCount)"
        }
    }
    
    private func emoji(for card: Card) -> String {
        if emojisForCardIndex[card.identifier] == nil, emojiChoices.count > 0 {
            emojisForCardIndex[card.identifier] = emojiChoices.remove(at: Int.random(in: 0...emojiChoices.count-1))
        }
        return emojisForCardIndex[card.identifier] ?? "?"
    }
    
    private func flipCard(withTitle emoji: String = "",for index: Int){
        if emoji.isEmpty {
            if !game.cards[index].isMatched {
                cardButtons[index].setTitle(emoji, for: .normal)
                cardButtons[index].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }else {
            let match = game.cards[index].isMatched
            cardButtons[index].setTitle(match ? "" : emoji, for: .normal)
            cardButtons[index].backgroundColor = match ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9549939036, green: 0.1228163317, blue: 0, alpha: 1)
        }
    }
}

