//
//  PersonAssembly.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import Foundation

protocol PersonAssembly {
    func personVC(data: CharacterCellData) -> PersonViewController <PersonViewImp>
    func personDataProvider() -> PersonDataProvider
    func personCoordinator(data: CharacterCellData) -> PersonCoordinator
}

extension Assembly: PersonAssembly {

    func personVC(data: CharacterCellData) -> PersonViewController <PersonViewImp> {
        .init(dataProvider: personDataProvider(), data: data)
    }

    func personDataProvider() -> PersonDataProvider {
        PersonDataProviderImp(apiClient: apiClient)
    }

    func personCoordinator(data: CharacterCellData) -> PersonCoordinator {
        PersonCoordinator(assembly: self, context: .init(data: data))
    }
}

