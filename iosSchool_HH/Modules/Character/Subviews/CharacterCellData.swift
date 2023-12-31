//
//  CharacterCellData.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import UIKit

struct CharacterCellData: CoreCellInputData {

    var selectClosure: ((CoreCellInputData) -> Void)?

    let isLoading: Bool
    let url: String
    let name: String?
    let info: String?
    let imageUrl: String?
    let image: UIImage?
    let episodes: [String]

    init(character: Character, isLoading: Bool, image: UIImage?, selectClosure: ((CoreCellInputData) -> Void)?) {
        self.url = character.url
        self.isLoading = isLoading
        self.name = character.name
        self.info = "\(character.gender) \(character.species)"
        self.imageUrl = character.image
        self.image = image
        self.selectClosure = selectClosure
        self.episodes = character.episode
    }

    init(url: String) {
        self.url = url
        isLoading = true
        name = nil
        info = nil
        imageUrl = nil
        image = nil
        episodes = []
    }
}
