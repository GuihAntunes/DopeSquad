//
//  RepositoryProtocols.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import UIKit

protocol HeroesRemoteRepositoryProtocol: class {
    func fetchHeroesList(lastIndex index: Int, completion: @escaping RequesterResult<APIMarvelCharacterListResponse>)
}

protocol HeroesLocalRepositoryProtocol: class {
    func recruitHeroToSquad(_ hero: HeroType, withThumbnail thumbnail: UIImage?)
    func removeHeroFromSquad(heroID id: Int)
    func retriveSquad() -> [HeroType]
}

protocol HeroesRepositoryProtocol: class {
    func fetchHeroesList(lastIndex index: Int, completion: @escaping (Result<[HeroType], NetworkError>) -> Void)
    func recruitHeroToSquad(_ hero: HeroType, withThumbnail thumbnail: UIImage?)
    func removeHeroFromSquad(_ hero: HeroType)
    func retriveSquad() -> [HeroType]
}
