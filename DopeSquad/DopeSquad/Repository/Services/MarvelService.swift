//
//  MarvelService.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import Foundation

class MarvelService: HeroesRemoteRepositoryProtocol {
    
    let requester: Requester
    
    init(requester: Requester = Requester()) {
        self.requester = requester
    }
    
    func fetchHeroesList(lastIndex index: Int, completion: @escaping RequesterResult<APIMarvelCharacterListResponse>) {
        requester.request(model: APIMarvelCharacterListResponse.self, HeroesEndpoints.list(lastIndex: index).request, completion: completion)
    }
    
}
