//
//  GenericServiceResponse.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import Foundation

struct MarvelCharacterListResponse: Codable {
    
    let code: Int?
    let status: String?
    let copyright: String?
    let data: HeroList?
    
}

struct HeroList: Codable {
    
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Hero]?
    
}

struct MarvelCharacterDetailsResponse: Codable {
    
    let code: Int?
    let status: String?
    let copyright: String?
    let data: DetailsList?
    
}

struct DetailsList: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [HeroComic]?
}
