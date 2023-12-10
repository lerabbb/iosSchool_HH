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

    init(character: Character, isLoading: Bool, image: UIImage?, selectClosure: ((CoreCellInputData) -> Void)?) {
        url = character.url
        self.selectClosure = selectClosure
        self.isLoading = isLoading
        self.name = character.name
        self.info = "\(character.gender) \(character.species)"
        self.imageUrl = character.image
        self.image = image
    }

    init(url: String) {
        self.url = url
        isLoading = true
        name = nil
        info = nil
        imageUrl = nil
        image = nil
    }
}
