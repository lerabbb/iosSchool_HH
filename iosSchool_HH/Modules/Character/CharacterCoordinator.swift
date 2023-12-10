//
//  CharacterCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import UIKit

class CharacterCoordinator: BaseCoordinator<CharacterCoordinator.Context> {

    struct Context {
        let data: LocationCellData
    }

    override func make() -> UIViewController? {
        assembly.characterVC(data: context.data)
    }
}
