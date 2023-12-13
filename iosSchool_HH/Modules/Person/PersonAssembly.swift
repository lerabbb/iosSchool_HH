//
//  PersonAssembly.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import Foundation

protocol PersonAssembly {
    func personVC() -> PersonViewController <PersonViewImp>
    func personDataProvider() -> PersonDataProvider
    func personCoordinator() -> PersonCoordinator
}

extension Assembly: PersonAssembly {

    func personVC() -> PersonViewController <PersonViewImp> {
        .init(dataProvider: personDataProvider())
    }

    func personDataProvider() -> PersonDataProvider {
        PersonDataProviderImp(apiClient: apiClient)
    }

    func personCoordinator() -> PersonCoordinator {
        PersonCoordinator(assembly: self, context: .init())
    }
}

