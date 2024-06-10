//
//  TrendModel.swift
//  MediaProject
//
//  Created by 하연주 on 6/10/24.
//

import Foundation

// MARK: - MovieTrend
struct MovieTrend: Codable {
    let page: Int
    let results: [MovieTrendResult]
}

// MARK: - Result
struct MovieTrendResult: Codable {
    let backdropPath: String
    let id: Int
    let originalTitle, overview, posterPath: String
    let mediaType: String
    let adult: Bool
    let title: String
    let originalLanguage: String
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id, overview, adult, title, popularity, video
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
