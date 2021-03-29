//
//  HeroAdapter.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import Foundation

class HeroAdapter {
    
    private var hero: APIHero
    
    init(withAPIHero hero: APIHero) {
        self.hero = hero
    }
    
}

extension HeroAdapter: HeroType {
    
    var name: String {
        return hero.name ?? LocalizableStrings.unknownHeroName.localize()
    }
    
    var biography: String {
        return hero.description ?? LocalizableStrings.unknownHeroDescription.localize()
    }
    
    var thumbnail: String {
        return hero.thumbnail?.path ?? ""
    }
    
}
