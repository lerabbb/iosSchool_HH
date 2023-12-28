//
//  ProfileApiClient.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import Foundation

protocol ProfileApiClient {
    func findSingleProfile(
        id: String,
        onRequestCompleted: @escaping (Profile?, ApiError?) -> Void
    )
}

extension ApiClient: ProfileApiClient {

    func findSingleProfile(
        id: String,
        onRequestCompleted: @escaping (Profile?, ApiError?) -> Void
    ) {
        let url = NetworkConstants.URLStrings.nanoPost + "/v1/profile/\(id)"
        self.performRequest(url: url, data: nil, method: .get) { (result: Result<Profile, ApiError>) in
            switch result {
            case .success(let profile):
                onRequestCompleted(profile, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
