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

        setRoot(viewController: assembly.registrationCoordinator().make())
        // authCoordinator -> registrationCoordinator in homework
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

}
