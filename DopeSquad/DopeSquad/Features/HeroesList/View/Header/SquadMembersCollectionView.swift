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
    
    // MARK: - Properties
    weak var delegate: SquadMembersCollectionDelegate?
    var heroes: [HeroType]
    
    // MARK: - Lazy Properties
    private lazy var squadTitleLabel: UILabel = {
        let label: UILabel = .init(frame: frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LocalizableStrings.mySquadTitle.localize()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var squadCollectionView: UICollectionView = {
        let collectionViewLayout: UICollectionViewFlowLayout = .init()
        collectionViewLayout.minimumInteritemSpacing = 8
        collectionViewLayout.minimumLineSpacing = 8
        collectionViewLayout.itemSize = .init(width: 64, height: 104)
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.sectionInset = .init(top: 16, left: 16, bottom: 16, right: 16)
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
    
    // MARK: - Setup Methods
    private func setupView() {
        backgroundColor = UIColor(named: UIColor.AppColors.appBackgroundColor.rawValue)
        addSubviews()
        setupConstraints()
        squadCollectionView.delegate = self
        squadCollectionView.dataSource = self
        squadCollectionView.reloadData()
    }
    
    private func addSubviews() {
        addSubview(squadCollectionView)
        addSubview(squadTitleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            squadTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            squadTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            squadCollectionView.topAnchor.constraint(equalTo: squadTitleLabel.bottomAnchor, constant: 16),
            squadCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            squadCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            squadCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Public Methods
    func reloadSquad(withNewSquad squad: [HeroType]) {
        DispatchQueue.main.async {
            self.heroes = squad
            self.squadCollectionView.reloadData()
        }
    }
    
}
