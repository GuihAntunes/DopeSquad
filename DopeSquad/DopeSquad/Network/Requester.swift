//
//  Requester.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import Foundation

typealias RequesterResult<C:Codable> = (Result<C, NetworkError>) -> Void

protocol RequesterProtocol {
    func request<T: Codable>(model: T.Type, _ request: URLRequest, completion: @escaping RequesterResult<T>)
}


final class Requester: RequesterProtocol {
    
    let connectionChecker: Reachability
    let decoder: JSONDecoder
    let session: URLSession
    
    init(connectionChecker: Reachability = .init(), decoder: JSONDecoder = .init(), session: URLSession = .shared) {
        self.decoder = decoder
        self.session = session
        self.connectionChecker = connectionChecker
    }
    
    func request<T: Codable>(model: T.Type, _ request: URLRequest, completion: @escaping RequesterResult<T>) {
            
        session.dataTask(with: request,  completionHandler: { [weak self] (data, response, error) in
                
                guard let _self = self else {
                    completion(.failure( NetworkError.deallocatedClassError(error: LocalizableStrings.releasedClassErrorMessage.localize())))
                    return
                }
                
                guard _self.connectionChecker.isConnected else {
                    completion(.failure(NetworkError.connectionError(error: LocalizableStrings.connectionErrorMessage.localize())))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NetworkError.sessionError(error: error?.localizedDescription ?? LocalizableStrings.genericErrorMessage.localize())))
                    return
                }
                
                guard error == nil else {
                    completion(.failure(NetworkError.sessionError(error: error?.localizedDescription ?? LocalizableStrings.genericErrorMessage.localize())))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    completion(.failure(NetworkError.sessionError(error: error?.localizedDescription ?? LocalizableStrings.genericErrorMessage.localize())))
                    return
                }
                
                guard let model = try? _self.decoder.decode(T.self, from: data) else {
                    completion(.failure(NetworkError.mappingError(error: String(format: LocalizableStrings.mappingErrorMessage.localize(), "\(T.self)"))))
                    return
                }
                
                completion(.success(model))
            }).resume()
    }
}
