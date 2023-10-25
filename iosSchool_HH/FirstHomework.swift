//
//  FirstHomework.swift
//  iosSchool_HH
//
//  Created by student on 25.10.2023.
//

import Foundation

struct Location {
    let id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
}

struct LocationList {
    struct Info {
        var count: Int
        var pages: Int
        var prev: String?
        var next: String?
    }

    var info: Info
    var results: [Location]
}

class Character {
    let id: Int
    var name: String
    var species: String
    var image: String
    var url: String
    var episode: [String]
    var gender: Gender
    var status: Status

    init(id: Int, name: String, species: String, image: String, url: String, episode: [String],
         gender: Gender, status: Status) {
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
}

class CharacterGenerator {
    static let values: [String] = ["abcd", "efg", "hijk", "lmn", "op", "qrst", "uvw", "xyz"]

    static func generate() -> Character {
        return Character(id: Int.random(in: 0..<100),
                         name: values.randomElement() ?? "aaa",
                         species: values.randomElement() ?? "bbb",
                         image: values.randomElement() ?? "ccc",
                         url: values.randomElement() ?? "ddd",
                         episode: ["ep1", "ep2", "ep3", "ep4"],
                         gender: Character.Gender.random(),
                         status: Character.Status.random())
    }
}
