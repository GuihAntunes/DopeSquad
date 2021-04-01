//
//  HeroDetailViewController+HeroDetailViewDelegate.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 01/04/2021.
//

import UIKit

extension HeroDetailViewController: HeroDetailViewDelegate {
    
    func backButtonPressed() {
        coordinator.presentPreviousStep()
    }
    
    func heroHiringButtonPressed() {
        if contentView.isSquadMember {
            viewModel.removeHeroFromSquad()
            return
        }
        viewModel.recruitHeroToSquad(withImage: contentView.heroImage)
    }
    
}
