//
//  HeroDetailView.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 01/04/2021.
//

import MapleBacon
import UIKit

protocol HeroDetailViewDelegate: class {
    func backButtonPressed()
    func heroHiringButtonPressed()
}

class HeroDetailView: UIView {
    
    // MARK: - Properties
    private var hero: HeroType
    private weak var delegate: HeroDetailViewDelegate?
    var isSquadMember: Bool = false {
        didSet {
            updateHiringButtonAppearance()
        }
    }
    var heroImage: UIImage? {
        return heroImageView.image
    }
    
    // MARK: - Lazy Properties
    private lazy var backButton: UIButton = {
        let button: UIButton = .init(frame: frame)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: ImagesNames.BackButtonImage.rawValue), for: .normal)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var heroImageView: UIImageView = {
        let imageView: UIImageView = .init(frame: frame)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.setImage(with: URL(string: hero.thumbnail))
        return imageView
    }()
    
    private lazy var heroNameLabel: UILabel = {
        let label: UILabel = .init(frame: frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = hero.name
        label.font = .boldSystemFont(ofSize: 34)
        label.numberOfLines = 2
        label.lineBreakStrategy = .pushOut
        return label
    }()
    
    private lazy var heroHiringButton: UIButton = {
        let button: UIButton = .init(frame: frame)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(heroHiringButtonPressed), for: .touchUpInside)
        button.roundCorners(.allCorners, radius: 8)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(named: UIColor.AppColors.hiringButtonBackgroundColor.rawValue)?.cgColor
        return button
    }()
    
    private lazy var heroBiographyTextView: UITextView = {
        let textView: UITextView = .init(frame: frame)
        textView.insertText(hero.biography)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        return textView
    }()
    
    private lazy var contentVStackView: UIStackView = {
        let stack: UIStackView = .init(frame: frame)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 16
        return stack
    }()

    init(withFrame frame: CGRect, hero: HeroType, andDelegate delegate: HeroDetailViewDelegate) {
        self.hero = hero
        self.delegate = delegate
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    private func setupView() {
        addViews()
        setupConstraints()
        updateHiringButtonAppearance()
    }
    
    private func addViews() {
        addSubview(heroImageView)
        addSubview(contentVStackView)
        contentVStackView.addArrangedSubview(heroNameLabel)
        contentVStackView.addArrangedSubview(heroHiringButton)
        contentVStackView.addArrangedSubview(heroBiographyTextView)
        addSubview(backButton)
        bringSubviewToFront(backButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heroImageView.topAnchor.constraint(equalTo: topAnchor),
            heroImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            heroImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            heroImageView.heightAnchor.constraint(equalToConstant: frame.height / 3)
        ])
        
        NSLayoutConstraint.activate([
            contentVStackView.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 24),
            contentVStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contentVStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            contentVStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24)
        ])
    }
    
    private func updateHiringButtonAppearance() {
        let title = isSquadMember ? LocalizableStrings.fireFromSquadButtonTitle.localize() : LocalizableStrings.recruitToSquadButtonTitle.localize()
        let backgroundColor = isSquadMember ? .clear : UIColor(named: UIColor.AppColors.hiringButtonBackgroundColor.rawValue)
        heroHiringButton.setTitle(title, for: .normal)
        heroHiringButton.backgroundColor = backgroundColor
    }
    
    // MARK: - Actions
    @objc private func dismissView() {
        delegate?.backButtonPressed()
    }
    
    @objc private func heroHiringButtonPressed() {
        DispatchQueue.main.async {
            self.isSquadMember.toggle()
            self.updateHiringButtonAppearance()
        }
        delegate?.heroHiringButtonPressed()
    }
}
