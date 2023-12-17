//
//  ProfileCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

class ProfileCoordinator: BaseCoordinator<ProfileCoordinator.Context> {

    struct Context {
    }

    override func make() -> UIViewController? {
        let controller = assembly.profileVC()
        return controller
    }
}
