//
//  ModuleMoviesSeriesNetworkService.swift
//  ModuleMoviesSeriesNetworkService
//
//  Created by Andre  Haas on 26/05/25.
//

import Foundation

@available(iOS 15.0, *)
@available(macOS 12.0, *)
public final class NetworkMovieService: NetworkServiceProtocol {
    private let session: URLSession
  
    nonisolated(unsafe) public static let shared = NetworkMovieService()
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    public func request<T: Decodable>(_ request: APIMovieRequest) async throws -> T {
        
        guard let baseUrl = ProcessInfo.processInfo.environment["BASE_URL"] else {
            throw NetworkMovieError.notfoundUrlBase
        }
        
        guard var urlComponents = URLComponents(string: baseUrl + request.path.path()),
              let url = urlComponents.url else {
            throw NetworkMovieError.invalidURL
        }
        guard let apiKey = ProcessInfo.processInfo.environment["API_KEY"] else {
            throw NetworkMovieError.notfoundApiKey
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "language", value: "pt-BR"),
            URLQueryItem(name: "region", value: "BR"),
            URLQueryItem(name: "page", value: "1")
        ]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        urlRequest.timeoutInterval = 60
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("accept", forHTTPHeaderField: "application/json")
        session.configuration.timeoutIntervalForRequest = 60
        session.configuration.timeoutIntervalForResource = 60
        
        let (data, response) = try await session.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkMovieError.networkError
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
