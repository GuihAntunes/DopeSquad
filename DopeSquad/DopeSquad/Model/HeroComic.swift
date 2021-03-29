//
//  HeroComic.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import Foundation

struct HeroComic: Codable {
    
    var id: Int?
    var title: String?
    var description: String?
    var resourceURI: String?
    
    init() {
        id = .init()
        title = .init()
        description = .init()
        resourceURI = .init()
    }
    
}
