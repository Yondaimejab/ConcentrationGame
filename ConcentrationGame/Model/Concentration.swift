//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Oriontek on 12/9/19.
//  Copyright © 2019 JoelsTeam. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    private(set) var flipCount: Int = 0
    private var facedUpCardIndex: Int? {
        get {
            var foundIndex: Int?
            for cardIndex in cards.indices {
                if cards[cardIndex].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = cardIndex
                    }else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for cardIndex in cards.indices {
                cards[cardIndex].isFaceUp = (cardIndex == newValue)
            }
        }
    }
    
    init(numberOfPairsOfCard: Int){
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards.append(contentsOf: [card, card])
        }
        shuffleCards()
    }
    
     func chooseCard(withIndex index: Int){
        flipCount += 1
        if !cards[index].isMatched {
            if let matchIndex = facedUpCardIndex, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else {
                facedUpCardIndex = index
            }
        }
    }
    
    func startOver(withCards amountOfPairs: Int) -> Concentration {
        return Concentration(numberOfPairsOfCard: amountOfPairs)
    }
    
    private func unMatchAllCards(){
        for index in cards.indices {
            if cards[index].isMatched {
               cards[index].isMatched = false
            }
        }
    }
    
    private func shuffleCards(){
        let amountOfCards = cards.count - 1
        for index in cards.indices {
            let indexToUseForShuffle = Int.random(in: 0...amountOfCards)
            let cardPlaceholder = cards[index]
            cards[index] = cards[indexToUseForShuffle]
            cards[indexToUseForShuffle] = cardPlaceholder
        }
    }
    
    private func flipDownAllCards(){
        for index in cards.indices {
            if cards[index].isFaceUp {
               cards[index].isFaceUp = false
            }
        }
    }
}
