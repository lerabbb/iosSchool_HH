//
//  ProfileAssembly.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import Foundation

protocol ProfileAssembly {
    func profileVC() -> ProfileViewController<ProfileViewImp>
    func profileDataProvider() -> ProfileDataProvider
    func profileCoordinator() -> ProfileCoordinator
}

extension Assembly: ProfileAssembly {

    func profileVC() -> ProfileViewController<ProfileViewImp> {
        .init(
            dataProvider: profileDataProvider(),
            storageManager: storageManager
        )
    }

    func profileDataProvider() -> ProfileDataProvider {
        ProfileDataProviderImp()
    }

    func profileCoordinator() -> ProfileCoordinator {
        ProfileCoordinator(assembly: self, context: .init())
    }
}
