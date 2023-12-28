//
//  PersonDataProvider.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import Foundation

protocol PersonDataProvider {
    func findSingleEpisode(
        url: String,
        onRequestCompleted: @escaping (Episode?, ApiError?) -> Void
    )
}

class PersonDataProviderImp: PersonDataProvider {

    private let apiClient: PersonApiClient

    init(apiClient: PersonApiClient) {
        self.apiClient = apiClient
    }

    func findSingleEpisode(
        url: String,
        onRequestCompleted: @escaping (Episode?, ApiError?) -> Void
    ) {
        apiClient.findSingleEpisode(url: url, onRequestCompleted: onRequestCompleted)
    }
}
