//
//  ProfileCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

class ProfileCoordinator: BaseCoordinator<ProfileCoordinator.Context> {

    struct Context {
        let onExit: (() -> Void)?
    }

    override func make() -> UIViewController? {
        assembly.profileVC(onExit: context.onExit)
    }
}
