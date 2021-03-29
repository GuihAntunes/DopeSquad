//
//  Hero.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import Foundation

struct Hero: Codable {
    
    var id : Int?
    var name : String?
    var description : String?
    var modified : String?
    var thumbnail : Thumbnail?
    var resourceURI : String?
    var comics : Resource?
    var series : Resource?
    var stories : Resource?
    var events : Resource?
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
