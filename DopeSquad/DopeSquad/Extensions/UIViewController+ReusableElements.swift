//
//  UIViewController+ReusableElements.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import UIKit

typealias AlertAction = (actionTitle: String, style: UIAlertAction.Style, actionHandler: ((UIAlertAction) -> Void)? )

extension UIViewController {
    
    // MARK: - Alert
    func alert(title: String = .init(), message: String, completion: (() -> Void)? = nil, okActionHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: LocalizableStrings.confirmButtonTitle.localize(), style: .default, handler: okActionHandler)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: completion)
    }
    
    func alert(title: String = .init(), message: String, completion: (() -> Void)? = nil, actions: [AlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach({
            let action = UIAlertAction(title: $0.actionTitle, style: $0.style, handler: $0.actionHandler)
            alertController.addAction(action)
        })
        present(alertController, animated: true, completion: completion)
    }
    
    // MARK: - Loading Indicator
    func addBlurLoading() {
        let showActivity = UIActivityIndicatorView()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.3
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        showActivity.center = view.center
        showActivity.color = UIColor.white
        blurEffectView.contentView.addSubview(showActivity)
        blurEffectView.contentView.bringSubviewToFront(showActivity)
        showActivity.startAnimating()
    }
    
    func removeBlurLoading() {
        view.subviews.forEach({ (view) in
            if view is UIVisualEffectView {
                view.removeFromSuperview()
            }
        })
    }
    
}
