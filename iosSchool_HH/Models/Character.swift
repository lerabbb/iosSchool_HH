//
//  Character.swift
//  iosSchool_HH
//
//  Created by student on 15.11.2023.
//

import Foundation

class Character: Decodable {
    enum Gender: String, CaseIterable, Decodable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"

        static func random() -> Gender {
            return allCases.randomElement() ?? unknown
        }
    }

    enum Status: String, CaseIterable, Decodable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"

        static func random() -> Status {
            return allCases.randomElement() ?? unknown
        }
    }

    let id: Int
    let name: String
    let species: String
    let image: String
    let url: String
    var episode: [String]
    let gender: Gender
    let status: Status

    init(
        id: Int,
        name: String,
        species: String,
        image: String,
        url: String,
        episode: [String],
        gender: Gender,
        status: Status
    ) {
        self.id = id
        self.name = name
        self.species = species
        self.image = image
        self.url = url
        self.episode = episode
        self.gender = gender
        self.status = status
    }

    func description() {
        print("character id: \(id), name: \(name), species: \(species), " +
              "image: \(image), url: \(url), " +
              "gender: \(gender.rawValue), status: \(status), episode: \(episode)")
    }
}
