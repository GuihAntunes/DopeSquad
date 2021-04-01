//
//  HeroesListViewController+TableView.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 31/03/2021.
//

import UIKit

extension HeroesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HeroTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setupCell(withHero: viewModel.heroes[indexPath.row])
        loadMoreContentIfNeeded(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator.presentNextStep(withModel: viewModel.heroes[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard !viewModel.squadHeroes.isEmpty else { return .init() }
        return squadHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.squadHeroes.isEmpty ? 0 : 180
    }
    
    // MARK: - Support Methods
    
    func loadMoreContentIfNeeded(_ currentHeroIndex: Int) {
        let shouldLoadMoreContent = currentHeroIndex >= viewModel.heroes.count - 1
        if shouldLoadMoreContent {
            loadContent()
        }
    }
}
