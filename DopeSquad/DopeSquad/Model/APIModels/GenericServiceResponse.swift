//
//  GenericServiceResponse.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import Foundation

struct APIMarvelCharacterListResponse: Codable {
    
    let code: Int?
    let status: String?
    let copyright: String?
    let data: APIHeroList?
    
}

struct APIHeroList: Codable {
    
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [APIHero]?
    
}

struct APIMarvelCharacterDetailsResponse: Codable {
    
    let code: Int?
    let status: String?
    let copyright: String?
    let data: APIDetailsList?
    
}

struct APIDetailsList: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [APIHeroComic]?
}
