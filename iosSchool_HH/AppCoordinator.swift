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
    private weak var authCoordinator: AuthCoordinator?

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
        guard assembly.storageManager.getToken() == nil else {
            setTabVC()
            return
        }
        authCoordinator = assembly.authCoordinator { [ weak self ] in
            DispatchQueue.main.async {
                self?.setTabVC()
            }
        }
        setRoot(viewController: authCoordinator?.make())
    }

    private func setTabVC() {
        let tabVC = assembly.rootTabBarController()

        let locationsCoord = assembly.locationCoordinator()
        let profileCoord = assembly.profileCoordinator(onOpenLogin: authCoordinator?.context.onOpenLogin)
        guard let locationsVC = locationsCoord.make(), let profileVC = profileCoord.make() else {
            return
        }
        let navVC = assembly.rootNavigationController()
        navVC.setViewControllers([locationsVC], animated: false)
        navVC.tabBarItem = RootTab.locations.tabBarItem

        profileVC.tabBarItem = RootTab.cabinet.tabBarItem
        tabVC.setViewControllers([navVC, profileVC], animated: false)
        setRoot(viewController: tabVC)
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
