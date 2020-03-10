//
//  theme.swift
//  ConcentrationGame
//
//  Created by Joel Alcantara on 3/3/20.
//  Copyright © 2020 JoelsTeam. All rights reserved.
//

import Foundation

struct Theme {
    let name: String
    let emojies: [String]
    
    static var halloweenTheme: Theme {
        return Theme(name: "Halloween", emojies: ["🎃","👻","😈","👽","💀","😱","🤡","👹"])
    }
    
    static var xmasTheme: Theme {
        return Theme(name: "Cristmas", emojies: ["🎅","🏂","⛷","⛄️","☃","❆","🏔","🎿"])
    }
    
    static var sportsTheme: Theme {
        return Theme(name: "Sport", emojies: ["🏀","🏈","🏉","⚽️","🏸","🥎","🎱","🏓"])
    }
    
    static var animalsTheme: Theme {
        return Theme(name: "Animals  ", emojies: ["🐨","🦒","🐥","🦓","🐯","🦁","🐷","🦄"])
    }
}
