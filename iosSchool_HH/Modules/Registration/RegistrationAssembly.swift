//
//  RegistrationAssembly.swift
//  iosSchool_HH
//
//  Created by student on 09.11.2023.
//

import Foundation

protocol RegistrationAssembly {
    func registrationVC() -> RegistrationViewController
    func registrationDataProvider() -> RegistrationDataProvider
    func registrationCoordinator() -> RegistrationCoordinator
}

extension Assembly: RegistrationAssembly {

    func registrationVC() -> RegistrationViewController {
        .init(dataProvider: registrationDataProvider())
    }

    func registrationDataProvider() -> RegistrationDataProvider {
        RegistrationDataProviderImp(apiClient: apiClient)
    }

    func registrationCoordinator() -> RegistrationCoordinator {
        RegistrationCoordinator(assembly: self, context: .init())
    }
}
