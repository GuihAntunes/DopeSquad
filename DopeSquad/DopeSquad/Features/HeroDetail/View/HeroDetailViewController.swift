//
//  HeroDetailViewController.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 01/04/2021.
//

import UIKit

class HeroDetailViewController: UIViewController {
    
    // MARK: - Properties
    lazy var contentView: HeroDetailView = .init(withFrame: view.frame, hero: viewModel.hero, andDelegate: self)
    var viewModel: HeroDetailViewModelProtocol
    var coordinator: AppCoordinatorProtocol
    
    // MARK: - Initializers
    init(withCoordinator coordinator: AppCoordinatorProtocol, andViewModel viewModel: HeroDetailViewModelProtocol) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Setup Methods
    private func setupView() {
        view.addSubview(contentView)
        view.backgroundColor = UIColor(named: UIColor.AppColors.appBackgroundColor.rawValue)
        contentView.isSquadMember = viewModel.isSquadMember
    }
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
