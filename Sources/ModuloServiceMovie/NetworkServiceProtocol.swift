//
//  NetworkServiceProtocol.swift
//  ModuleMoviesSeriesNetworkService
//
//  Created by Andre  Haas on 26/05/25.
//

protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ request: APIRequest) async throws -> T
}
