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
    }

    enum Status: String, CaseIterable, Codable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
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
