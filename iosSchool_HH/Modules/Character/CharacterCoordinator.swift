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
        let characterVC = assembly.characterVC(data: context.data)
        characterVC.selectCharacter = { [weak characterVC] cellData in
            let coordinator = self.assembly.personCoordinator()
            guard let personVC = coordinator.make() else {
                return
            }
            characterVC?.navigationController?.pushViewController(personVC, animated: true)
        }
        return characterVC
    }
}
