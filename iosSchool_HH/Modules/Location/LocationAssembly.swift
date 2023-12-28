//
//  LocationAssembly.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import Foundation

protocol LocationAssembly {
    func locationVC() -> LocationViewController <LocationViewImp>
    func locationDataProvider() -> LocationDataProvider
    func locationCoordinator() -> LocationCoordinator
}

extension Assembly: LocationAssembly {

    func locationVC() -> LocationViewController <LocationViewImp> {
        .init(dataProvider: locationDataProvider())
    }

    func locationDataProvider() -> LocationDataProvider {
        LocationsDataProviderImp(apiClient: apiClient)
    }

    func locationCoordinator() -> LocationCoordinator {
        LocationCoordinator(assembly: self, context: .init())
    }
}
