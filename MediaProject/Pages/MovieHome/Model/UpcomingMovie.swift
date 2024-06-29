//
//  UpcomingMovie.swift
//  MediaProject
//
//  Created by 하연주 on 6/29/24.
//

import Foundation

struct UpcomingMovie: Decodable {
    var results: [UpcomingMovieResult]
}

struct UpcomingMovieResult : Decodable {
    let poster_path : String
}
