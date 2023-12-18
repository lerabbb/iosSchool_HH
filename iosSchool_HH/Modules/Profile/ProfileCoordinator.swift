//
//  ProfileCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

class ProfileCoordinator: BaseCoordinator<ProfileCoordinator.Context> {

    struct Context {
        let onOpenLogin: (() -> Void)?
    }

    override func make() -> UIViewController? {
        let profileVC = assembly.profileVC()
        profileVC.onExit = { [weak profileVC] in
            let coordinator = self.assembly.authCoordinator(onOpenLogin: self.context.onOpenLogin)
            guard let authVC = coordinator.make() else {
                return
            }
            profileVC?.show(authVC, sender: profileVC)
        }
        return profileVC
    }
}
