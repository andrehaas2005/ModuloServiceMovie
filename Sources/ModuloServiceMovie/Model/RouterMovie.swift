//
//  RouterMovie.swift
//  ModuloServiceMovie
//
//  Created by Andre  Haas on 20/06/25.
//

public enum RouterMovie: String {
    case topRated =  "top_rated"
    case nowPlaying = "now_playing"
    case popular = "popular"
    case upcoming = "upcoming"
    
    func path() -> String {
        return rawValue
    }
}
