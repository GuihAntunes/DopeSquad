//
//  AppAppearance.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import UIKit

class AppAppearance {
    
    static func setAppAppearance() {
        setAppBackgroundColor()
        setLabelsAppeareance()
    }
    
    static func setAppBackgroundColor() {
        let subviewsBackgroundColor = UIColor(named: UIColor.AppColors.appBackgroundColor.rawValue)
        UITableView.appearance().backgroundColor = subviewsBackgroundColor
        UITextView.appearance().textColor = UIColor(named: UIColor.AppColors.textColor.rawValue)
        UITextView.appearance().font = .systemFont(ofSize: 17)
        UILabel.appearance().textColor = UIColor(named: UIColor.AppColors.textColor.rawValue)
    }
    
    static func setLabelsAppeareance() {
        UILabel.appearance().textColor = UIColor(named: UIColor.AppColors.textColor.rawValue)
    }
    
}
