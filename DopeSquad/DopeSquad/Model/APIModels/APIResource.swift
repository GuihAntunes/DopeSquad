//
//  Resource.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import Foundation

struct APIResource : Codable {
    
    let available : Int?
    let collectionURI : String?
    let items : [APIItem]?
    let returned : Int?

}
