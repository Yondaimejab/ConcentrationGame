//
//  Card.swift
//  ConcentrationGame
//
//  Created by Oriontek on 12/9/19.
//  Copyright © 2019 JoelsTeam. All rights reserved.
//

import Foundation

struct Card {
    
    // Atributes
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    // Static Atributes
    static var uniqueIdentifier = 0
    
    static func identifierFactory() -> Int {
        uniqueIdentifier += 1
        return uniqueIdentifier
    }
    
    // Init
    init(){
        self.identifier = Card.identifierFactory()
    }
}
