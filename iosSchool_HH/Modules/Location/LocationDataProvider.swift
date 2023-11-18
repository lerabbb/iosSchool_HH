//
//  LocationDataProvider.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import Foundation

protocol LocationDataProvider {
    func findAllLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void)
}

class LocationsDataProviderImp: LocationDataProvider {

    private let apiClient: LocationApiClient

    init(apiClient: LocationApiClient) {
        self.apiClient = apiClient
    }

    func findAllLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void) {
        apiClient.findAllLocations(onRequestCompleted: onRequestCompleted)
    }
}

