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

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.airDate = try container.decode(String.self, forKey: .airDate)
        self.url = try container.decode(String.self, forKey: .url)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.airDate, forKey: .airDate)
        try container.encode(self.url, forKey: .url)
    }
}
