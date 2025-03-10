//
//  VideoGame.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez on 07/02/25.
//

import Foundation

struct VideoGame: Identifiable, Codable {
    let id: Int
    let title: String
    let shortDescription: String
    let genre: String
    let thumbnail: String
    let gameURL: String
    let releaseDate: String
    let platform: String
    let publisher: String
    let developer: String
    let freetogameProfileUrl: String

    enum CodingKeys: String, CodingKey {
        case id
        case title = "title"
        case shortDescription = "short_description"
        case genre
        case thumbnail
        case gameURL = "game_url"
        case releaseDate = "release_date"
        case platform
        case publisher
        case developer
        case freetogameProfileUrl = "freetogame_profile_url"
    }
}
