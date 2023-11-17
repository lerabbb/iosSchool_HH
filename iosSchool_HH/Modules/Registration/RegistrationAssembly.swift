//
//  RegistrationAssembly.swift
//  iosSchool_HH
//
//  Created by student on 09.11.2023.
//

import Foundation

protocol RegistrationAssembly {
    func registrationVC(onRegistrationSuccess: (() -> Void)?) -> RegistrationViewController<RegistrationViewImp>
    func registrationDataProvider() -> RegistrationDataProvider
    func registrationCoordinator(onRegistrationSuccess: (() -> Void)?) -> RegistrationCoordinator
}

extension Assembly: RegistrationAssembly {

    func registrationVC(onRegistrationSuccess: (() -> Void)?) -> RegistrationViewController<RegistrationViewImp> {
        .init(dataProvider: registrationDataProvider(), onRegistrationSuccess: onRegistrationSuccess)
    }

    func registrationDataProvider() -> RegistrationDataProvider {
        RegistrationDataProviderImp()
    }

    func registrationCoordinator(onRegistrationSuccess: (() -> Void)?) -> RegistrationCoordinator {
        RegistrationCoordinator(assembly: self, context: .init(onRegistrationSuccess: onRegistrationSuccess))
    }
}
