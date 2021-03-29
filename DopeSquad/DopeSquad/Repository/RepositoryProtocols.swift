//
//  RepositoryProtocols.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import UIKit

protocol HeroesRemoteRepositoryProtocol: class {
    func fetchHeroesList(lastIndex index: Int, completion: @escaping RequesterResult<MarvelCharacterListResponse>)
}

protocol HeroesLocalRepositoryProtocol: class {
    func recruitHeroToSquad(_ hero: Hero, withThumbnail thumbnail: UIImage?)
    func removeHeroFromSquad(_ hero: Hero)
    func retriveSquad() -> [Hero]
}

protocol HeroesRepositoryProtocol: HeroesRemoteRepositoryProtocol & HeroesLocalRepositoryProtocol {  }
