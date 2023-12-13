//
//  PersonCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import UIKit

class PersonCoordinator: BaseCoordinator<PersonCoordinator.Context> {

    struct Context {}

    override func make() -> UIViewController? {
        assembly.personVC()
    }
}
