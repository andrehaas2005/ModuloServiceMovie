//
//  Cover.swift
//  ModuloServiceMovie
//
//  Created by Andre  Haas on 27/05/25.
//


struct Cover: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}