//
//  Hero.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import Foundation

struct APIHero: Codable {
    
    var id: Int?
    var name: String?
    var description: String?
    var modified: String?
    var thumbnail: APIThumbnail?
    var resourceURI: String?
    var comics: APIResource?
    var series: APIResource?
    var stories: APIResource?
    var events: APIResource?
    var imageData: Data? = nil
    
    init() {
        id = .init()
        name = .init()
        description = .init()
        modified = .init()
        thumbnail = nil
        resourceURI = .init()
        comics = nil
        series = nil
        stories = nil
        events = nil
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, modified, thumbnail, resourceURI, comics, series, stories, events
    }
}
