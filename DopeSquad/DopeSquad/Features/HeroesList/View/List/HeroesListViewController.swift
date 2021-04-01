//
//  HeroesListViewController.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import UIKit

class HeroesListViewController: UIViewController {
    
    lazy var heroesTableView: UITableView = {
        let tableView: UITableView = .init(frame: view.frame, style: .plain)
        tableView.register(UINib(nibName: HeroTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HeroTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.rowHeight = 92
        tableView.refreshControl = refreshControl
        return tableView
    }()
    
    lazy var squadHeaderView: SquadMembersCollectionView = .init(withDelegate: self, frame: view.frame, andHeroes: viewModel.squadHeroes)
    
    lazy var refreshControl: UIRefreshControl = {
        let refresh: UIRefreshControl = .init(frame: view.frame)
        refresh.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        refresh.tintColor = .white
        return refresh
    }()
    
    var viewModel: HeroesListViewModelProtocol
    var coordinator: AppCoordinatorProtocol
    
    init(withViewModel viewModel: HeroesListViewModelProtocol, andCoordinator coordinator: AppCoordinatorProtocol) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        loadContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        squadHeaderView.reloadSquad(withNewSquad: viewModel.squadHeroes)
    }
    
    // MARK: - Setup Methods
    func loadContent() {
        addBlurLoading()
        refreshList()
    }
    
    func setupController() {
        setupColorScheme()
        setupTableView()
        setupConstraints()
    }
    
    func setupColorScheme() {
        view.backgroundColor = UIColor(named: UIColor.AppColors.appBackgroundColor.rawValue)
    }
    
    private func setupTableView() {
        view.addSubview(heroesTableView)
        view.bringSubviewToFront(heroesTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heroesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            heroesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            heroesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            heroesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.layoutIfNeeded()
    }
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.titleView = UIImageView(image: UIImage(named: "Marvel"))
        navigationController?.navigationBar.barTintColor = UIColor(named: UIColor.AppColors.appBackgroundColor.rawValue)
    }
    
    @objc private func refreshList() {
        viewModel.loadContent { [weak self] result in
            guard let self = self else { return }
            self.refreshControl.endRefreshing()
            self.removeBlurLoading()
            switch result {
            case .success:
                self.heroesTableView.reloadData()
            case .failure(let error):
                self.alert(message: error.localizedDescription)
            }
        }
    }
}
