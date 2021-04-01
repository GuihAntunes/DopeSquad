//
//  HeroesListViewModelTests.swift
//  DopeSquadTests
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import XCTest
@testable import DopeSquad

class HeroesListViewModelTests: XCTestCase {
    
    var sut: HeroesListViewModel!
    var mockedRepository: MockedRepository = .init()
    
    class MockedRepository: HeroesRepositoryProtocol {
        
        var shouldTriggerErrorFlow = false
        var shouldBeMultipleHeroesScenario = false
        
        func fetchHeroesList(lastIndex index: Int, completion: @escaping (Result<[HeroType], NetworkError>) -> Void) {
            if shouldTriggerErrorFlow {
                completion(.failure(.generalError(error: "Some error")))
                return
            }
            let fileName: String = shouldBeMultipleHeroesScenario ? "MultipleHeroListResponseExample" : "HeroListResponseExample"
            let response: APIMarvelCharacterListResponse = generateModels(fileName: fileName)
            guard let heroes = response.data?.results else {
                completion(.failure(.generalError(error: "Failed to get mocked data")))
                return
            }
            completion(.success(heroes.map({ HeroAdapter(withAPIHero: $0) })))
        }
        
        func recruitHeroToSquad(_ hero: HeroType, withThumbnail thumbnail: UIImage?) { }
        
        func removeHeroFromSquad(_ hero: HeroType) { }
        
        func retriveSquad() -> [HeroType] { return .init() }

    }
    

    override func setUp() {
        sut = .init(withRepository: mockedRepository)
    }
    
    func testSuccessScenario_shouldReturnAListOfHeroes() {
        sut.loadContent { result in
            switch result {
            case .success(let success):
                XCTAssert(success)
                XCTAssert(self.sut.squadHeroes.isEmpty)
                XCTAssert(!self.sut.heroes.isEmpty)
                
            case .failure:
                XCTFail("Fell into error scenario")
            }
        }
    }
    
    func testSuccessScenarioForPagination_shouldReturnABiggerListOfHeroes() {
        mockedRepository.shouldBeMultipleHeroesScenario = true
        sut.loadContent { result in
            switch result {
            case .success(let success):
                XCTAssert(success)
                XCTAssert(self.sut.squadHeroes.isEmpty)
                XCTAssert(!self.sut.heroes.isEmpty)
                XCTAssert(self.sut.heroes.count == 6)
                self.mockedRepository.shouldBeMultipleHeroesScenario = false
                self.sut.loadContent { result in
                    switch result {
                    case .success(let success):
                        XCTAssert(success)
                        XCTAssert(self.sut.squadHeroes.isEmpty)
                        XCTAssert(!self.sut.heroes.isEmpty)
                        XCTAssert(self.sut.heroes.count == 7)
                    case .failure:
                        XCTFail("Fell into error scenario")
                    }
                }
            case .failure:
                XCTFail("Fell into error scenario")
            }
        }
    }
    
    func testSuccessScenarioForRemovingDuplicates_shouldReturnTheSameListOfHeroes() {
        sut.loadContent { result in
            switch result {
            case .success(let success):
                XCTAssert(success)
                XCTAssert(self.sut.squadHeroes.isEmpty)
                XCTAssert(!self.sut.heroes.isEmpty)
                XCTAssert(self.sut.heroes.count == 1)
                self.sut.loadContent { result in
                    switch result {
                    case .success(let success):
                        XCTAssert(success)
                        XCTAssert(self.sut.squadHeroes.isEmpty)
                        XCTAssert(!self.sut.heroes.isEmpty)
                        XCTAssert(self.sut.heroes.count == 1)
                    case .failure:
                        XCTFail("Fell into error scenario")
                    }
                }
            case .failure:
                XCTFail("Fell into error scenario")
            }
        }
    }
    
    func testErrorScenario_shouldAssertEmptyList() {
        mockedRepository.shouldTriggerErrorFlow = true
        sut.loadContent { result in
            switch result {
            case .success:
                XCTFail("Fell into success scenario")
            case .failure:
                XCTAssert(self.sut.squadHeroes.isEmpty)
                XCTAssert(self.sut.heroes.isEmpty)
            }
        }
    }

}
