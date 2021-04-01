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
    
    func testAdapterTypeTransformation_shouldTransformAPIHeroToHeroType() {
        XCTAssert(sut.id == 1009610)
        XCTAssert(sut.name == "Spider-Man")
        XCTAssert(sut.biography == "Bitten by a radioactive spider, high school student Peter Parker gained the speed, strength and powers of a spider. Adopting the name Spider-Man, Peter hoped to start a career using his new abilities. Taught that with great power comes great responsibility, Spidey has vowed to use his powers to help people.")
        XCTAssert(sut.thumbnail == "http://i.annihil.us/u/prod/marvel/i/mg/3/50/526548a343e4b.jpg")
    }

}
