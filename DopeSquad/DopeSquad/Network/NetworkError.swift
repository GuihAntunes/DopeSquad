//
//  NetworkError.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import Foundation

enum NetworkError: Error {
    case invalidRequest
    case noInternetConnection
    case noHTTPURLResponse
    case statusCodeError(statusCode: Int)
    case sessionError(error: String)
    case mappingError(error: String)
    case unknown(description: String)
    case connectionError(error: String)
    case generalError(error: String)
    case deallocatedClassError(error: String)
}
