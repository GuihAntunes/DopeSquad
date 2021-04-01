//
//  Thumbnail.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import Foundation

struct APIThumbnail : Codable {
    
    let path : String?
    let thumbnailExtension: String?
    let fullPath: String?
    
    init(withFullPath fullPath: String?) {
        self.fullPath = fullPath
        self.path = nil
        self.thumbnailExtension = nil
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
        case fullPath
    }
    
}
