//
//  Episode.swift
//  iosSchool_HH
//
//  Created by student on 17.12.2023.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let airDate: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case url
    }
}
