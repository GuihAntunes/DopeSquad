//
//  HeroTableViewCell.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import UIKit

class HeroTableViewCell: ImageDownloaderTableViewCell {

    @IBOutlet weak var cardView: UIView?
    @IBOutlet weak var heroImageView: UIImageView?
    @IBOutlet weak var heroNameLabel: UILabel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetCell()
    }
    
    func setupCell(withHero hero: HeroType) {
        cardView?.roundCorners([.allCorners], radius: 8)
        heroImageView?.roundCorners([.allCorners], radius: 22)
        heroNameLabel?.text = hero.name
        handleHeroImage(hero.thumbnail)
    }
    
    func resetCell() {
        heroImageView?.image = nil
        heroNameLabel?.text = nil
        imageDownloader.cancelAllOperations()
    }
    
    private func handleHeroImage(_ urlString: String) {
        imageDownloader.addOperation { [weak self] in
            guard let url = URL(string: urlString), let imageData = try? Data(contentsOf: url), !imageData.isEmpty else { return }
            OperationQueue.main.addOperation {
                self?.heroImageView?.image = UIImage(data: imageData)
            }
        }
    }
}
