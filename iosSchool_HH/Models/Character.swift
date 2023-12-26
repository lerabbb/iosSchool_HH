//
//  Character.swift
//  iosSchool_HH
//
//  Created by student on 15.11.2023.
//

import Foundation

class Character: Codable {
    enum Gender: String, CaseIterable, Codable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"

        static func random() -> Gender {
            return allCases.randomElement() ?? unknown
        }
    }

    enum Status: String, CaseIterable, Codable {
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
}
