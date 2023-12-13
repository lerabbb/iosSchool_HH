//
//  PersonDataProvider.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import Foundation

protocol PersonDataProvider {}

class PersonDataProviderImp: PersonDataProvider {

    private let apiClient: PersonApiClient

    init(apiClient: PersonApiClient) {
        self.apiClient = apiClient
    }

}
