//
//  HeroesListViewController+SquadMembersCollectionDelegate.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 01/04/2021.
//

import Foundation

extension HeroesListViewController: SquadMembersCollectionDelegate {
    func heroSelected(_ hero: HeroType) {
        coordinator.presentNextStep(withModel: hero)
    }
}
