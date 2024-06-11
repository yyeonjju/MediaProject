//
//  MovieGenre.swift
//  MediaProject
//
//  Created by 하연주 on 6/11/24.
//

import Foundation


struct MovieGenre : Codable {
    let genres : [Genre]
}

struct Genre : Codable {
    let id : Int
    let name : String
}
