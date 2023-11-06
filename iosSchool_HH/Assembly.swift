//
//  Assembly.swift
//  iosSchool_HH
//
//  Created by student on 26.10.2023.
//

import Foundation

class Assembly {

    func colorGenerator(alpha: Double) -> ColorGenerator {
        ColorGenerator(alpha: alpha)
    }

    func appCoordinator() -> AppCoordinator {
        // AppCoordinator(assembly: self, context: .init())
        AppCoordinator(assembly: self, context: CoordinatorContext())
    }

}
