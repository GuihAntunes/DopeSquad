//
//  Endpoint.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    var httpMethod: String { get }
    var request: URLRequest { get }
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {
    
    private var infoList: [String: Any] {
        guard let infoList = Bundle.main.infoDictionary else {
            return .init()
        }
        
        return infoList
    }
    
    var baseURL: String {
        
        guard let url = infoList["BASE_URL"] as? String else {
            return .init()
        }
        
        return url
    }
    
    var publicKey: String {
        guard let publicKey = infoList["PUBLIC_KEY"] as? String else {
            return .init()
        }
        
        return publicKey
    }
    
    var privateKey: String {
        guard let privateKey = infoList["PRIVATE_KEY"] as? String else {
            return .init()
        }
        
        return privateKey
    }
    
}
