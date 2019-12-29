//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Oriontek on 12/9/19.
//  Copyright © 2019 JoelsTeam. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    init(numberOfPairsOfCard: Int){
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards.append(contentsOf: [card, card])
        }
        shuffleCards()
    }
    
    func chooseCard(withIndex index: Int){
          
    }
    
    private func shuffleCards(){
        let amountOfCards = cards.count - 1
        for (index,_) in cards.enumerated() {
            let indexToUseForShuffle = Int.random(in: 0...amountOfCards)
            let cardPlaceholder = cards[index]
            cards[index] = cards[indexToUseForShuffle]
            cards[indexToUseForShuffle] = cardPlaceholder
        }
    }
}
