//
//  HeroType.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import Foundation

protocol HeroType {
    var id: Int { get }
    var name: String { get }
    var biography: String { get }
    var thumbnail: String { get }
}
