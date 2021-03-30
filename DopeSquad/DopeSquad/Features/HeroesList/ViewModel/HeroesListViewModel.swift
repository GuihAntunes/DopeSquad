//
//  HeroesListViewModel.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import UIKit

protocol HeroesListViewModelProtocol: class {
    var squadHeroes: [HeroType] { get }
    var heroes: [HeroType] { get }
    func loadContent(completion: @escaping (Result<Bool, NetworkError>) -> Void)
}

class HeroesListViewModel: HeroesListViewModelProtocol {
    
    lazy var squadHeroes: [HeroType] = repository.retriveSquad()
    var heroes: [HeroType] = .init()
    var lastIndex: Int = 0
    var repository: HeroesRepositoryProtocol
    
    init(withRepository repository: HeroesRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadContent(completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        repository.fetchHeroesList(lastIndex: lastIndex) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let heroes):
                self.heroes.append(contentsOf: heroes)
                self.lastIndex = self.heroes.count
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
