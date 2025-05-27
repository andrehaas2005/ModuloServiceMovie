//
//  NetworkError.swift
//  ModuleMoviesSeriesNetworkService
//
//  Created by Andre  Haas on 26/05/25.
//

enum NetworkError: Error {
    case invalidURL
    case networkError
    case notfoundUrlBase
    case notfoundApiKey
}
