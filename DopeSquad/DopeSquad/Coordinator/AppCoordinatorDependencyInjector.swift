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
        navigation.viewControllers.append(heroesListViewController)
        return navigation
    }()
    
    // MARK: - View Controllers
    private lazy var heroesListViewController: UIViewController = {
        return HeroesListViewController(withViewModel: heroesListViewModel, andCoordinator: appCoordinator)
    }()
    
    // MARK: - View Models
    private lazy var heroesListViewModel: HeroesListViewModel = {
        return HeroesListViewModel(withRepository: heroesRepository)
    }()
    
    // MARK: - Repositories
    private lazy var heroesRepository: HeroesRepositoryProtocol = {
        return HeroesRepository()
    }()
    
    // MARK: - Injector Methods
    func getDetailViewController(withModel model: HeroType) -> UIViewController {
        let viewModel = HeroDetailViewModel(withRepository: heroesRepository)
        viewModel.hero = model
        return HeroDetailViewController(withCoordinator: appCoordinator, andViewModel: viewModel)
    }
    
}
