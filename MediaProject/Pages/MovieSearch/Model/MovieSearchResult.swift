//
//  MovieSearchResult.swift
//  MediaProject
//
//  Created by 하연주 on 6/11/24.
//

import Foundation

class MovieResultObject<T : Codable> : Codable {
    let page: Int
    var results: [T]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


class MovieResult : Codable {
    let genreIDS: [Int]
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let releaseDate, title: String
    let posterPath : String?

    enum CodingKeys: String, CodingKey {
        case id, overview, popularity, title
        case genreIDS = "genre_ids"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"

    }
}



class MovieSearch : MovieResultObject<MovieSearchResult>{}
class MovieSearchResult : MovieResult {}

//struct MovieSearch: Codable {
//    let page: Int
//    var results: [MovieSearchResult]
//    let totalPages, totalResults: Int
//
//    enum CodingKeys: String, CodingKey {
//        case page, results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//}
//
//// MARK: - Result
//struct MovieSearchResult: Codable {
//    let genreIDS: [Int]
//    let id: Int
//    let originalTitle, overview: String
//    let popularity: Double
//    let releaseDate, title: String
//    let posterPath : String?
//
//    enum CodingKeys: String, CodingKey {
//        case id, overview, popularity, title
//        case genreIDS = "genre_ids"
//        case originalTitle = "original_title"
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//
//    }
//}
