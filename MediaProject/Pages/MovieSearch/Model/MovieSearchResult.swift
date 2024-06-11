//
//  MovieSearchResult.swift
//  MediaProject
//
//  Created by 하연주 on 6/11/24.
//

import Foundation


struct MovieSearch: Codable {
    let page: Int
    let results: [MovieSearchResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MovieSearchResult: Codable {
    let genreIDS: [Int]
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String

    enum CodingKeys: String, CodingKey {
        case id, overview, popularity, title
        case genreIDS = "genre_ids"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"

    }
}
