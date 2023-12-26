//
//  LocationsList.swift
//  iosSchool_HH
//
//  Created by student on 13.11.2023.
//

import Foundation

struct LocationsList: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let prev: String?
        let next: String?
    }

    let info: Info
    let results: [Location]
}
