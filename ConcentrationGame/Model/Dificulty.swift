//
//  Dificulty.swift
//  ConcentrationGame
//
//  Created by Joel Alcantara on 3/3/20.
//  Copyright © 2020 JoelsTeam. All rights reserved.
//

import Foundation

// TODO: manage amount of cards so the game is harder and also time.
struct Dificulty {
    var amountOfEmojisInGame: Int
    var timeInSecunds: Int
    var timeInMinutes: String {
        return "\(timeInSecunds / 60)"
    }
}
