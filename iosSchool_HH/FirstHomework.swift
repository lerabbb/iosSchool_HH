//
//  FirstHomework.swift
//  iosSchool_HH
//
//  Created by student on 25.10.2023.
//

import Foundation

struct Location {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}

struct LocationList {
    struct Info {
        let count: Int
        let pages: Int
        let prev: String?
        let next: String?
    }

    let info: Info
    let results: [Location]
}

class Character {
    enum Gender: String, CaseIterable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"

        static func random() -> Gender {
            return allCases.randomElement() ?? unknown
        }
    }

    enum Status: String, CaseIterable {
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
    let episode: [String]
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
        print("[CHARACTER] id: \(id), name: \(name), species: \(species), image: \(image), url: \(url)")
        print("episode: \(episode)")
        print("gender: \(gender.rawValue), status: \(status.rawValue)")
    }
}

protocol CharacterGeneratorProtocol {
    var values: [String] { get }

    init(values: [String])

    func generate() -> Character
}

class CharacterGenerator: CharacterGeneratorProtocol {
    let values: [String]

    required init(values: [String]) {
        self.values = values
    }

    func generate() -> Character {
        return Character(
            id: Int.random(in: 0..<100),
            name: getRandomString(),
            species: getRandomString(),
            image: getRandomString(),
            url: getRandomString(),
            episode: ["ep1", "ep2", "ep3", "ep4"],
            gender: Character.Gender.random(),
            status: Character.Status.random()
        )
    }

    func getRandomString() -> String {
        return values.randomElement() ?? "xxx"
    }
}
