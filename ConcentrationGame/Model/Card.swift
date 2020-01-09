//
//  Card.swift
//  ConcentrationGame
//
//  Created by Oriontek on 12/9/19.
//  Copyright © 2019 JoelsTeam. All rights reserved.
//

import Foundation

struct Card: Equatable {
    
    // Atributes
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    // Static Atributes
    private static var uniqueIdentifier = 0
    private static func identifierFactory() -> Int {
        uniqueIdentifier += 1
        return uniqueIdentifier
    }
    
    // Init
    init(){
        self.identifier = Card.identifierFactory()
        self.isFaceUp = false
        self.isMatched = false
    }
    
    static func ==(firstCard: Card, secundCard: Card) -> Bool {
        return firstCard.identifier == secundCard.identifier
    }
}
