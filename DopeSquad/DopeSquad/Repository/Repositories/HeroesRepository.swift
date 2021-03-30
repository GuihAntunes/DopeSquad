//
//  HeroesRepository.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import UIKit

class HeroesRepository: HeroesRepositoryProtocol {
    
    let remoteService: HeroesRemoteRepositoryProtocol
    let localService: HeroesLocalRepositoryProtocol
    
    init(remoteService: HeroesRemoteRepositoryProtocol = MarvelService(), localService: HeroesLocalRepositoryProtocol = LocalService()) {
        self.remoteService = remoteService
        self.localService = localService
    }
    
    func fetchHeroesList(lastIndex index: Int, completion: @escaping (Result<[HeroType], NetworkError>) -> Void) {
        DispatchQueue.global().async { [weak self] in
            self?.remoteService.fetchHeroesList(lastIndex: index) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let response):
                        guard let heroes = response.data?.results else {
                            completion(.failure(.generalError(error: LocalizableStrings.genericErrorMessage.localize())))
                            return
                        }
                        
                        completion(.success(heroes.map({ HeroAdapter(withAPIHero: $0) })))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
        }
        
    }
    
    func recruitHeroToSquad(_ hero: HeroType, withThumbnail thumbnail: UIImage?) {
        DispatchQueue.global().async { [weak self] in
            self?.localService.recruitHeroToSquad(hero, withThumbnail: thumbnail)
        }
    }
    
    func removeHeroFromSquad(_ hero: HeroType) {
        DispatchQueue.global().async { [weak self] in
            self?.localService.removeHeroFromSquad(heroID: hero.id)
        }
    }
    
    func retriveSquad() -> [HeroType] {
        return localService.retriveSquad()
    }
    
}
