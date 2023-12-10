//
//  CharacterAssembly.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import Foundation

protocol CharacterAssembly {
    func characterVC(data: LocationCellData) -> CharacterViewController<CharacterViewImp>
    func characterDataProvider() -> CharacterDataProvider
    func characterCoordinator(data: LocationCellData) -> CharacterCoordinator
}

extension Assembly: CharacterAssembly {

    func characterVC(data: LocationCellData) -> CharacterViewController<CharacterViewImp> {
        .init(dataProvider: characterDataProvider(), data: data, imageService: imageService)
    }

    func characterDataProvider() -> CharacterDataProvider {
        CharacterDataProviderImp(apiClient: apiClient)
    }

    func characterCoordinator(data: LocationCellData) -> CharacterCoordinator {
        CharacterCoordinator(assembly: self, context: .init(data: data))
    }
}
