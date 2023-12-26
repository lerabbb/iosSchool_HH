//
//  ProfileDataProvider.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import Foundation

protocol ProfileDataProvider {
    func findSingleProfile(
        id: String,
        onRequestCompleted: @escaping (Profile?, ApiError?) -> Void
    )
}

class ProfileDataProviderImp: ProfileDataProvider {
    private let apiClient: ProfileApiClient

    init(apiClient: ProfileApiClient) {
        self.apiClient = apiClient
    }

    func findSingleProfile(
        id: String,
        onRequestCompleted: @escaping (Profile?, ApiError?) -> Void
    ) {
        apiClient.findSingleProfile(id: id, onRequestCompleted: onRequestCompleted)
    }
}
