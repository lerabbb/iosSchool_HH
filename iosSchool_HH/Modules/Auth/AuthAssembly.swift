//
//  AuthAssembly.swift
//  iosSchool_HH
//
//  Created by student on 06.11.2023.
//

import Foundation

protocol AuthAssembly {
    func authVC() -> AuthViewController
    func authDataProvider() -> AuthDataProvider
    func authCoordinator() -> AuthCoordinator
}

extension Assembly: AuthAssembly {

    func authVC() -> AuthViewController {
        .init(dataProvider: authDataProvider())
    }

    func authDataProvider() -> AuthDataProvider {
        AuthDataProviderImp()
    }

    func authCoordinator() -> AuthCoordinator {
        AuthCoordinator(assembly: self, context: .init())
    }
}
