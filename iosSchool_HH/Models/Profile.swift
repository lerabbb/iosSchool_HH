//
//  Profile.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import Foundation

struct Profile: Codable {
    let id: String
    let username: String
    let subscribed: Bool
    let subscribersCount: Int
    let postsCount: Int
    let imagesCount: Int
}
