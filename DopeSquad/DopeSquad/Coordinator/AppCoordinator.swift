//
//  AppCoordinator.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import UIKit

protocol AppCoordinatorProtocol: class {
    func presentNextStep(withModel model: HeroType)
    func presentPreviousStep()
}

enum RoutingState {
    case list
    case detail
}

class AppCoordinator: AppCoordinatorProtocol {
    
    lazy var injector = AppCoordinatorDependencyInjector()
    var window: UIWindow
    var state: RoutingState = .list
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        setupNavigationController()
        window.rootViewController = injector.navigationController
        window.makeKeyAndVisible()
    }
    
    func setupNavigationController() {
        
    }
    
    func presentNextStep(withModel model: HeroType) {
            switch state {
            case .list:
                state = .detail
                break
            case.detail:
                print("Last controller for this coordination flow!")
            }
        }
    
    func presentPreviousStep() {
        switch state {
        case .list:
            print("")
        case.detail:
            state = .list
            print("")
        }
    }
}
