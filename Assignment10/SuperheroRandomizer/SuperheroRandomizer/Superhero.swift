//
//  Superhero.swift
//  SuperheroRandomizer
//
//  Created by Аяулым Куат on 01.12.2025.
//

import Foundation

struct Superhero: Codable {
    let id: Int
    let name: String
    let slug: String
    let powerstats: PowerStats
    let appearance: Appearance
    let biography: Biography
    let images: Images
}

struct PowerStats: Codable {
    let intelligence: Int?
    let strength: Int?
    let speed: Int?
    let durability: Int?
    let power: Int?
    let combat: Int?
}

struct Appearance: Codable {
    let gender: String?
    let race: String?
    let height: [String]?
    let weight: [String]?
}

struct Biography: Codable {
    let fullName: String?
    let placeOfBirth: String?
    let firstAppearance: String?
    let alignment: String?
}

struct Images: Codable {
    let xs: String
    let sm: String
    let md: String
    let lg: String
}
