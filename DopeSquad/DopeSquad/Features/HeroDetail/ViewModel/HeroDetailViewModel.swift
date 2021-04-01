//
//  HeroDetailViewModel.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import UIKit

protocol HeroDetailViewModelProtocol: class {
    var hero: HeroType { get }
    var isSquadMember: Bool { get }
    func recruitHeroToSquad(withImage image: UIImage?)
    func removeHeroFromSquad()
}

class HeroDetailViewModel: HeroDetailViewModelProtocol {
    
    var repository: HeroesRepositoryProtocol
    var hero: HeroType = HeroAdapter(withAPIHero: .init())
    lazy var isSquadMember: Bool = repository.retriveSquad().contains { $0.id == hero.id }
    var selectedHero: HeroType? {
        didSet {
            guard let hero = selectedHero else { return }
            self.hero = hero
        }
    }
    
    init(withRepository repository: HeroesRepositoryProtocol) {
        self.repository = repository
    }
    
    func recruitHeroToSquad(withImage image: UIImage?) {
        repository.recruitHeroToSquad(hero, withThumbnail: image)
    }
    
    func removeHeroFromSquad() {
        repository.removeHeroFromSquad(hero)
    }
}
