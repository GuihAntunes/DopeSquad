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
    func recruitHeroToSquad(_ hero: APIHero, withThumbnail thumbnail: UIImage?)
    func removeHeroFromSquad(_ hero: APIHero)
    func retriveSquad() -> [APIHero]
}

protocol HeroesRepositoryProtocol: HeroesRemoteRepositoryProtocol & HeroesLocalRepositoryProtocol {  }
