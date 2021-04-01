//
//  HeroTableViewCell.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import MapleBacon
import UIKit

class HeroTableViewCell: UITableViewCell {

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
        heroImageView?.setImage(with: URL(string: hero.thumbnail))
    }
    
    func resetCell() {
        heroImageView?.image = nil
        heroNameLabel?.text = nil
        heroImageView?.cancelDownload()
    }
}
