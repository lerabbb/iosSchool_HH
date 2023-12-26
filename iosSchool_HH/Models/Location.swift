//
//  Locations.swift
//  iosSchool_HH
//
//  Created by student on 13.11.2023.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dim: String
    let residents: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case dim = "dimension"
        case residents
    }
}
