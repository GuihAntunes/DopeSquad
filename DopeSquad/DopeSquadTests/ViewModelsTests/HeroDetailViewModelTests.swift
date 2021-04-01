//
//  HeroDetailViewModelTests.swift
//  DopeSquadTests
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import XCTest
@testable import DopeSquad

class HeroDetailViewModelTests: XCTestCase {

    var sut: HeroDetailViewModel!
    var mockedRepository: MockedRepository = .init()
    
    class MockedRepository: HeroesRepositoryProtocol {
        
        var recruitHeroCalled = false
        var removeHeroCalled = false
        var retriveSquadCalled = false
        
        func fetchHeroesList(lastIndex index: Int, completion: @escaping (Result<[HeroType], NetworkError>) -> Void) {  }
        
        func recruitHeroToSquad(_ hero: HeroType, withThumbnail thumbnail: UIImage?) {
            recruitHeroCalled = true
        }
        
        func removeHeroFromSquad(_ hero: HeroType) {
            removeHeroCalled = true
        }
        
        func retriveSquad() -> [HeroType] {
            retriveSquadCalled = true
            return [MockedHero()]
        }

    }
    
    struct MockedHero: HeroType {
        var thumbnailData: Data? {
            return nil
        }
        
        var id: Int {
            return 10
        }
        
        var name: String {
            return "Spider-Man"
        }
        
        var biography: String {
            return "The best hero because he's one of us."
        }
        
        var thumbnail: String {
            return "Thumbnail"
        }
        
        
    }
    

    override func setUp() {
        sut = .init(withRepository: mockedRepository)
    }
    
    func testRecruitingToSquadMethod_shouldPassToRepositoryCorrectly() {
        sut.recruitHeroToSquad(withImage: nil)
        XCTAssert(mockedRepository.recruitHeroCalled)
    }
    
    func testRemoveToSquadMethod_shouldPassToRepositoryCorrectly() {
        sut.removeHeroFromSquad()
        XCTAssert(mockedRepository.removeHeroCalled)
    }
    
    func testRetriveSquadMethod_shouldPassToRepositoryCorrectlyWhenGettingTheHeroToSquad() {
        sut.selectedHero = MockedHero()
        XCTAssert(sut.hero.id == sut.selectedHero?.id)
        XCTAssert(sut.isSquadMember)
        XCTAssert(mockedRepository.retriveSquadCalled)
    }
}
