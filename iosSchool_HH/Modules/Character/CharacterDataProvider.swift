//
//  CharacterDataProvider.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import Foundation

protocol CharacterDataProvider {
    func findSingleCharacter(
        url: String,
        onRequestCompleted: @escaping (Character?, ApiError?) -> Void
    )
}

class CharacterDataProviderImp: CharacterDataProvider {

    private let apiClient: CharacterApiClient

    init(apiClient: CharacterApiClient) {
        self.apiClient = apiClient
    }

    func findSingleCharacter(
        url: String,
        onRequestCompleted: @escaping (Character?, ApiError?) -> Void
    ) {
        apiClient.findSingleCharacter(url: url, onRequestCompleted: onRequestCompleted)
    }
}
