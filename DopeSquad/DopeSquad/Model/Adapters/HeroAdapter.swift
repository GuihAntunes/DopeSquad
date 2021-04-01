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
        guard let name = hero.name, !name.isEmpty else { return LocalizableStrings.unknownHeroName.localize() }
        return name
    }
    
    var biography: String {
        guard let biography = hero.description, !biography.isEmpty else { return LocalizableStrings.unknownHeroDescription.localize() }
        return biography
    }
    
    var thumbnail: String {
        if let fullPath = hero.thumbnail?.fullPath {
            return fullPath
        }
        
        guard let path = hero.thumbnail?.path, let pathExtension = hero.thumbnail?.thumbnailExtension else { return .init() }
        return String(format: "%@.%@", path, pathExtension)
    }
    
    var id: Int {
        return hero.id
    }
    
    var thumbnailData: Data? {
        return hero.imageData
    }
    
}
