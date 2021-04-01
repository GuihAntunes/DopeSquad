//
//  LocalizableStrings.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import Foundation

enum LocalizableStrings: String {
    
    // MARK: - View Elements Strings
    case confirmButtonTitle = "confirmButton_title"
    case backButtonTitle = "backButton_title"
    case unknownHeroName = "unknownHero_name"
    case unknownHeroDescription = "unknownHero_description"
    case recruitToSquadButtonTitle = "recruitToSquad_buttonTitle"
    case fireFromSquadButtonTitle = "fireFromSquad_buttonTitle"
    
    // MARK: - Error Messages
    case genericErrorTitle = "genericError_title"
    case genericErrorMessage = "genericError_message"
    case releasedClassErrorMessage = "releasedClassError_message"
    case connectionErrorMessage = "connectionError_message"
    case mappingErrorMessage = "mappingError_message"
    
    func localize() -> String {
        return self.rawValue.localize()
    }
}
