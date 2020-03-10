//
//  ConcentrationGameViewModel.swift
//  ConcentrationGame
//
//  Created by Joel Alcantara on 3/3/20.
//  Copyright © 2020 JoelsTeam. All rights reserved.
//

import Foundation

class ConcentrationGameViewModel {
    
    let themes = [Theme.animalsTheme, Theme.halloweenTheme, Theme.sportsTheme, Theme.xmasTheme]
    // Functions - list of Model Functions
    /// This funtion returns all available themes for a concentration Game.
    func getThemes() -> [String] {
        var listOfThemes: [String] = []
        for theme in themes {
            listOfThemes.append(theme.name)
        }
        return listOfThemes
    }
    
    func getEmojiesForThemeWith(name: String) -> [String] {
        return themes.first { $0.name == name}!.emojies
    }
}
