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
        viewModel.recruitHeroToSquad(withImage: contentView.heroImage)
    }
    
}
