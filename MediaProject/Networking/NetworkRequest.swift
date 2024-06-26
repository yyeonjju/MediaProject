//
//  NetworkRequest.swift
//  MediaProject
//
//  Created by 하연주 on 6/26/24.
//

import Foundation
import Alamofire


enum NetworkRequest {
//    case getLottoInfo
//    case getBoxOfficeData
    case getMovieTrendData
    case getMovieCreditData(movieId : String)
    case getMovieGenreData
    case getMovieSearchData(query : String, page : String)
    case getRecommendationMovieData(movieId : String, recommendationType : String)
    case getUpcomingMovieData
    
    
    
    
    private var baseURL : String{
        switch self {
        case .getMovieTrendData,.getMovieCreditData, .getMovieGenreData, .getMovieSearchData, .getRecommendationMovieData, .getUpcomingMovieData :
            return "\(APIURL.scheme)://\(APIURL.tmdbHost)/\(APIURL.tmdbVersion)/"
        }
    }
    
    var endpoint : String {
        switch self {
        case .getMovieTrendData:
            return baseURL + "trending/movie/day"
        case .getMovieCreditData(let movieId):
            return baseURL + "movie/\(movieId)/credits"
        case .getMovieGenreData:
            return baseURL + "genre/movie/list"
        case .getMovieSearchData:
            return baseURL + "search/movie"
        case .getRecommendationMovieData(let movieId, let recommendationType):
            return baseURL + "movie/\(movieId)/\(recommendationType)"
        case .getUpcomingMovieData :
            return baseURL + "movie/upcoming"
        }
    }
    
    var method : HTTPMethod {
        switch self {
        case .getMovieTrendData,.getMovieCreditData, .getMovieGenreData, .getMovieSearchData, .getRecommendationMovieData, .getUpcomingMovieData :
            return .get
        }
        
    }
    
    var parameters : Parameters {
        switch self {
        case .getMovieTrendData,.getMovieCreditData, .getMovieGenreData, .getRecommendationMovieData, .getUpcomingMovieData :
            return [:]
        case .getMovieSearchData(let query, let page) :
            return[
                "query": query,
                "page" : page
            ]
        }
    }
    
    var encoding : URLEncoding {
        switch self {
        case .getMovieTrendData,.getMovieCreditData, .getMovieGenreData, .getRecommendationMovieData, .getUpcomingMovieData :
            return .default
        case .getMovieSearchData:
            return URLEncoding(destination: .queryString)
        }
    }
    
    var headers : HTTPHeaders {
        switch self {
        case .getMovieTrendData,.getMovieCreditData, .getMovieGenreData, .getMovieSearchData, .getRecommendationMovieData, .getUpcomingMovieData:
            return [
                "Authorization" : "Bearer \(APIKey.tmdbAccessToken)",
                "accept" : "application/json"
            ]
        }
    }
    
    
    
    
}
