//
//  AuthCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 06.11.2023.
//

import UIKit

class AuthCoordinator: BaseCoordinator<AuthCoordinator.Context> {

    struct Context {}

    override func make() -> UIViewController? {
        assembly.authVC()
    }
}
