//
//  NetworkConstants.swift
//  iosSchool_HH
//
//  Created by student on 13.11.2023.
//

import Foundation

struct NetworkConstants {
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case patch = "PATCH"
        case put = "PUT"
        case delete = "DELETE"
    }

    struct URLStrings {
        static let nanoPost = "https://nanopost.evolitist.com/api"
        static let locationURL = "https://rickandmortyapi.com/api/location"
        static let characterURL = "https://rickandmortyapi.com/api/character"
        static let episodeURL = "https://rickandmortyapi.com/api/episode"
    }
}
