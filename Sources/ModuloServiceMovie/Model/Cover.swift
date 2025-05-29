//
//  Cover.swift
//  ModuloServiceMovie
//
//  Created by Andre  Haas on 27/05/25.
//


struct Cover<T: Codable>: Codable {
    let page: Int
    let results: [T]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
