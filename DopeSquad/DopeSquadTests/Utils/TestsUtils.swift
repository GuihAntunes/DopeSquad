//
//  TestsUtils.swift
//  DopeSquadTests
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import Foundation
@testable import DopeSquad

func generateModels<T: Codable>(fileName: String) -> T {
    let bundle = Bundle(for: HeroAdapterTests.self)
    guard let url = bundle.url(forResource: fileName, withExtension: "json"), let data = try? Data(contentsOf: url) else {
        fatalError("Check your mock")
    }
    
    guard let model = try? JSONDecoder().decode(T.self, from: data) else {
        fatalError("Check your mock")
    }
    
    
    return model
}
