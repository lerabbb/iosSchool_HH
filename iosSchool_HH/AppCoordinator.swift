//
//  AppCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 06.11.2023.
//

import Foundation
import UIKit

struct CoordinatorContext {}

class AppCoordinator: BaseCoordinator<CoordinatorContext> {

    private var window: UIWindow?

    func start(window: UIWindow?) {
        self.window = window
        let coordinator = assembly.splashCoordinator { [weak self] in
            self?.authBootstrap()
        }
        setRoot(
            viewController: coordinator.make()
        )
    }

    private func authBootstrap() {
        setRoot(viewController: assembly.authCoordinator().make())
//        setRoot(viewController: assembly.registrationCoordinator().make())
//        setRoot(viewController: assembly.locationCoordinator().make())
//        setRoot(viewController: assembly.characterCoordinator().make())
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

}
