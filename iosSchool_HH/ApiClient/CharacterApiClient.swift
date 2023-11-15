//
//  CharacterApiClient.swift
//  iosSchool_HH
//
//  Created by student on 15.11.2023.
//

import Foundation

protocol CharacterApiClient {
    func findSingleCharacter(
        url: String,
        onRequestCompleted: @escaping (Character?, ApiError?) -> Void
    )
}

extension ApiClient: CharacterApiClient {
    func findSingleCharacter(
        url: String,
        onRequestCompleted: @escaping (Character?, ApiError?) -> Void
    ) {
        performRequest(url: url, data: nil, method: .get) { (result: Result<Character, ApiError>) in
            switch result {
            case .success(let character):
                onRequestCompleted(character, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
