//
//  RegistrationApiClient.swift
//  iosSchool_HH
//
//  Created by student on 15.11.2023.
//

import Foundation

protocol RegistrationApiClient {
    func registration(
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

extension ApiClient: RegistrationApiClient {
    func registration(
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        do {
            let userData = try JSONEncoder().encode(User(username: username, password: password))
            let url = NetworkConstants.URLStrings.nanoPost + "/auth/register"
            performRequest(url: url, data: userData, method: .post) { (result: Result<TokenResponse, ApiError>) in
                switch result {
                case .success(let token):
                    onRequestCompleted(token, nil)
                case .failure(let error):
                    onRequestCompleted(nil, error)
                }
            }
        } catch {
            print("registration: fail while encoding")
        }
    }
}
