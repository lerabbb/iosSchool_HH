//
//  RegistrationApiClient.swift
//  iosSchool_HH
//
//  Created by student on 15.11.2023.
//

import Foundation

protocol RegistrationApiClient {
    func registration(
        user: User,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

extension ApiClient: RegistrationApiClient {
    func registration(
        user: User,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        let userData = try? JSONEncoder().encode(user)
        let url = NetworkConstants.URLStrings.nanoPost + "/auth/register"
        performRequest(url: url, data: userData, method: .post) { (result: Result<TokenResponse, ApiError>) in
            switch result {
            case .success(let token):
                onRequestCompleted(token, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
