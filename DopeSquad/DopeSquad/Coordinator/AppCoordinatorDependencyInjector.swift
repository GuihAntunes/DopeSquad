//
//  AppCoordinatorDependencyInjector.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import UIKit

class AppCoordinatorDependencyInjector {
    
    // MARK: - Coordinator
    lazy var appCoordinator: AppCoordinator = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let coordinator = appDelegate.coordinator else { return AppCoordinator(window: UIWindow(frame: UIScreen.main.bounds)) }
        return coordinator
    }()
    
    // MARK: - Main Navigation
    lazy var navigationController: UINavigationController = {
        let navigation: UINavigationController = .init()
        navigation.setNavigationBarHidden(true, animated: false)
        return navigation
    }()
    
    // MARK: - View Controllers
    
    
    func getHeroDetailViewController<T: Codable>(withModel model: T) {
        
    }
    
    // MARK: - View Models
    private lazy var heroListViewModel: HeroesListViewModel = {
        return HeroesListViewModel(withRepository: heroesRepository)
    }()
    
    // MARK: - Repositories
    private lazy var heroesRepository: HeroesRepositoryProtocol = {
        return HeroesRepository()
    }()
    
}
