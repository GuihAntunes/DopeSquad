//
//  ViewController.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let repository = HeroesRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        repository.fetchHeroesList(lastIndex: 0) { (result) in
            switch result {
            case .success(let heroes):
                print(heroes)
            case .failure(let error):
                print(error)
            }
        }
    }


}

