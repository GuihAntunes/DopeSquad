//
//  SquadMemberCollectionViewCell.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 01/04/2021.
//

import MapleBacon
import UIKit

class SquadMemberCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var heroImageView: UIImageView?
    @IBOutlet weak var heroNameLabel: UILabel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetCell()
    }
    
    func setup(withHero hero: HeroType) {
        heroNameLabel?.text = hero.name
        heroImageView?.roundCorners(.allCorners, radius: 32)
        if let data = hero.thumbnailData {
            heroImageView?.image = UIImage(data: data)
            return
        }
        heroImageView?.setImage(with: URL(string: hero.thumbnail))
    }
    
    private func resetCell() {
        heroNameLabel?.text = .init()
        heroImageView?.image = nil
        heroImageView?.cancelDownload()
    }
    
}
