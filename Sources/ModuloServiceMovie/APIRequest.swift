//
//  APIRequest.swift
//  ModuleMoviesSeriesNetworkService
//
//  Created by Andre  Haas on 26/05/25.
//

import Foundation


// APIRequest.swift
struct APIRequest {
    let path: String
    let method: HTTPMethod
    let body: Data?

    init(path: String, method: HTTPMethod, body: Data? = nil) {
        self.path = path
        self.method = method
        self.body = body
    }
}
