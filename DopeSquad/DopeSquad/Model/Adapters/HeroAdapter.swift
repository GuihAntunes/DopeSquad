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
        guard let path = hero.thumbnail?.path, let pathExtension = hero.thumbnail?.thumbnailExtension else { return .init() }
        return String(format: "%@.%@", path, pathExtension)
    }
    
    var id: Int {
        return hero.id
    }
    
}
