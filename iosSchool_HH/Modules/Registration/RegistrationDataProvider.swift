//
//  RegistrationDataProvider.swift
//  iosSchool_HH
//
//  Created by student on 09.11.2023.
//

import Foundation

protocol RegistrationDataProvider {
    func registration(
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

class RegistrationDataProviderImp: RegistrationDataProvider {

    private let apiClient: RegistrationApiClient

    init(apiClient: RegistrationApiClient) {
        self.apiClient = apiClient
    }

    func registration(
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        apiClient.registration(username: username, password: password, onRequestCompleted: onRequestCompleted)
    }
}
