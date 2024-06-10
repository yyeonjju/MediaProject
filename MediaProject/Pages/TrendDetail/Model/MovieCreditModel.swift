//
//  MovieCreditModel.swift
//  MediaProject
//
//  Created by 하연주 on 6/10/24.
//

import Foundation

struct MovieCredit: Codable {
    let id: Int
    let cast: [Cast]
}

// MARK: - Cast
struct Cast: Codable {
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment, name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castID: Int?
    let character, creditID: String?
    let order: Int?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id, name, popularity, character, order
        case knownForDepartment = "known_for_department"
        case originalName = "original_name"
        case profilePath = "profile_path"
        case castID = "cast_id"
        case creditID = "credit_id"
    }
}
