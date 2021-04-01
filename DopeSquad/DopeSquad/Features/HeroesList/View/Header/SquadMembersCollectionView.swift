//
//  SquadMembersCollectionView.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 01/04/2021.
//

import UIKit

protocol SquadMembersCollectionDelegate: class {
    func heroSelected(_ hero: HeroType)
}

class SquadMembersCollectionView: UIView {
    
    weak var delegate: SquadMembersCollectionDelegate?
    var heroes: [HeroType]
    private lazy var squadCollectionView: UICollectionView = {
        let collectionViewLayout: UICollectionViewFlowLayout = .init()
        collectionViewLayout.minimumInteritemSpacing = 8
        collectionViewLayout.minimumLineSpacing = 8
        collectionViewLayout.itemSize = .init(width: 64, height: 104)
        collectionViewLayout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: frame, collectionViewLayout: collectionViewLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.register(UINib(nibName: SquadMemberCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: SquadMemberCollectionViewCell.reuseIdentifier)
        return collection
    }()
    
    init(withDelegate delegate: SquadMembersCollectionDelegate, frame: CGRect, andHeroes heroes: [HeroType]) {
        self.delegate = delegate
        self.heroes = heroes
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubviews()
        setupConstraints()
        squadCollectionView.delegate = self
        squadCollectionView.dataSource = self
        squadCollectionView.reloadData()
    }
    
    private func addSubviews() {
        addSubview(squadCollectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            squadCollectionView.topAnchor.constraint(equalTo: topAnchor),
            squadCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            squadCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            squadCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
