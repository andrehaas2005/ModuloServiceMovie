//
//  ModuleMoviesSeriesNetworkServiceTests.swift
//  ModuleMoviesSeriesNetworkServiceTests
//
//  Created by Andre  Haas on 26/05/25.
//

import XCTest
@testable import ModuloServiceMovie

final class NetworkServiceTests: XCTestCase {
    var networkService: NetworkServiceProtocol!

    override func setUp() {
        super.setUp()
        networkService = NetworkService(apiKey: "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZmIwOGRlZTQ2NTFjM2Q5YjE1MzZhNjllYTNmM2QxNiIsIm5iZiI6MTQyMDQ3MTA3MC44MDcwMDAyLCJzdWIiOiI1NGFhYWIxZWMzYTM2ODBjMzAwMDc0MjEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.O5QokbNrnxRhRqEdR8kq3Zvd0S1TkON2uFg-JwdOzOE",
                                        baseUrl: "https://api.themoviedb.org/3/")
    }

    func testRequestSuccess() async {
                  
        let request = APIRequest(path: "movie/top_rated", method: .get)

        do {
            let movies: Cover = try await networkService.request(request)
            XCTAssertNotNil(movies)
        } catch {
            XCTFail("Request failed with error: \(error)")
        }
    }
}
