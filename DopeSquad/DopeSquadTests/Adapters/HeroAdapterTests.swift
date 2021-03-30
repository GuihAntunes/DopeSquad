//
//  HeroAdapterTests.swift
//  DopeSquadTests
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import XCTest
@testable import DopeSquad

class HeroAdapterTests: XCTestCase {
    
    var sut: HeroAdapter!

    override func setUp() {
        let heroes: APIMarvelCharacterListResponse = generateModels(fileName: "HeroListResponseExample")
        guard let hero = heroes.data?.results?.first else {
            XCTFail("Failed to generate mock")
            return
        }
        sut = .init(withAPIHero: hero)
    }

}
