//
//  ModuleMoviesSeriesNetworkService.swift
//  ModuleMoviesSeriesNetworkService
//
//  Created by Andre  Haas on 26/05/25.
//

import Foundation

@available(iOS 15.0, *)
@available(macOS 12.0, *)
class NetworkService: NetworkServiceProtocol {
    private let session: URLSession
    private let apiKey: String
    private let baseUrl: String
    
    init(session: URLSession = .shared, apiKey: String, baseUrl: String) {
        self.session = session
        self.apiKey = apiKey
        self.baseUrl = baseUrl
    }
    
    func request<T: Decodable>(_ request: APIRequest) async throws -> T {
        guard var urlComponents = URLComponents(string: baseUrl + request.path) else {
            throw NetworkError.invalidURL
        }
        
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "language", value: "pt-BR"),
            URLQueryItem(name: "page", value: "1")
        ]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await session.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.networkError
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
