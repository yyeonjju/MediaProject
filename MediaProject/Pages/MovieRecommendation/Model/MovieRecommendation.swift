//
//  MovieRecommendation.swift
//  MediaProject
//
//  Created by 하연주 on 6/24/24.
//

import Foundation


//similar
//class MovieSimilar : MovieResultObject<MovieSimilarResult>{}
//class MovieSimilarResult : MovieResult {}


//recommendation
struct MovieRecommendaion:Codable{
    let page: Int
    var results: [MovieRecommendaionResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
struct MovieRecommendaionResult : Codable {
    let posterPath : String?
    
    enum CodingKeys: String, CodingKey{
        case posterPath = "poster_path"
    }
}
