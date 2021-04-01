//
//  SquadMemberCollectionViewCell.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 01/04/2021.
//

import UIKit

class SquadMemberCollectionViewCell: ImageDownloaderCollectionViewCell {

    @IBOutlet weak var heroImageView: UIImageView?
    @IBOutlet weak var heroNameLabel: UILabel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func setup(withHero hero: HeroType) {
        heroNameLabel?.text = hero.name
        handleHeroImage(hero.thumbnail)
    }
    
    private func handleHeroImage(_ urlString: String) {
        imageDownloader.addOperation { [weak self] in
            guard let url = URL(string: urlString), let imageData = try? Data(contentsOf: url), !imageData.isEmpty else { return }
            DispatchQueue.main.async {
                self?.heroImageView?.image = UIImage(data: imageData)
            }
        }
    }
    
    private func resetCell() {
        heroNameLabel?.text = .init()
        heroImageView?.image = nil
        imageDownloader.cancelAllOperations()
    }
    
}
