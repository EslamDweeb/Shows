//
//  ShowsData.swift
//  Shows
//
//  Created by eslam dweeb on 25/12/2021.
//

import Foundation
// MARK: - ShowsDatum
struct ShowsDatum: Codable {
    let score: Double
    let show: Show
}

// MARK: - Show
struct Show: Codable {
    let id: Int
    let url: String
    let name: String
    let type: String
    let language: String
    let genres: [String]
    let status: String
    let runtime: Int?
    let averageRuntime: Int
    let premiered, ended: String
    let officialSite: String?
    let schedule: Schedule
    let rating: Rating
    let weight: Int
    let network, webChannel: Network?
    let externals: Externals
    let image: Image?
    let summary: String
    let updated: Int
    let links: Links

    enum CodingKeys: String, CodingKey {
        case id, url, name, type, language, genres, status, runtime, averageRuntime, premiered, ended, officialSite, schedule, rating, weight, network, webChannel, externals, image, summary, updated
        case links = "_links"
    }
}
// MARK: - Schedule
struct Schedule: Codable {
    let time: String
    let days: [String]
}
// MARK: - Rating
struct Rating: Codable {
    let average: Int?
}
// MARK: - Network
struct Network: Codable {
    let id: Int
    let name: String
    let country: Country
}
// MARK: - Country
struct Country: Codable {
    let name, code, timezone: String
}
// MARK: - Links
struct Links: Codable {
    let linksSelf, previousepisode: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case previousepisode
    }
}
struct Externals: Codable {
    let tvrage, thetvdb: Int?
    let imdb: String?
}
// MARK: - Image
struct Image: Codable {
    let medium, original: String
}
