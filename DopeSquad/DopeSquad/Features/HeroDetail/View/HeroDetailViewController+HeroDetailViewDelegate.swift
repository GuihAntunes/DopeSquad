//
//  HeroDetailViewController+HeroDetailViewDelegate.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 01/04/2021.
//

import UIKit

extension HeroDetailViewController: HeroDetailViewDelegate {
    
    func showAlertConfirmationForSquadRemoval() {
        let confirmationAction: AlertAction = (actionTitle: LocalizableStrings.resignationConfirmationButtonTitle.localize(), style: .default, actionHandler: { _ in
            self.contentView.updateSquad()
        })
        
        let cancelAction: AlertAction = (actionTitle: LocalizableStrings.resignationDenialButtonTitle.localize(), style: .default, actionHandler: nil)
        
        let message = String(format: LocalizableStrings.resignationConfirmationAlertMessage.localize(), viewModel.hero.name)
        alert(message: message, actions: [confirmationAction, cancelAction])
    }
    
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
