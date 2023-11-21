//
//  LocationApiClient.swift
//  iosSchool_HH
//
//  Created by student on 15.11.2023.
//

import Foundation

protocol LocationApiClient {
    func findAllLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void)
}

extension ApiClient: LocationApiClient {
    func findAllLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void) {
        let url = NetworkConstants.URLStrings.locationURL
        performRequest(url: url, data: nil, method: .get) { (result: Result<LocationsList, ApiError>) in
            switch result {
            case .success(let locationList):
                onRequestCompleted(locationList, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
