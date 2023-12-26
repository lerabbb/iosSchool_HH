//
//  ProfileAssembly.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import Foundation

protocol ProfileAssembly {
    func profileVC(onExit: (() -> Void)?) -> ProfileViewController<ProfileViewImp>
    func profileDataProvider() -> ProfileDataProvider
    func profileCoordinator(onExit: (() -> Void)?) -> ProfileCoordinator
}

extension Assembly: ProfileAssembly {

    func profileVC(onExit: (() -> Void)?) -> ProfileViewController<ProfileViewImp> {
        .init(
            dataProvider: profileDataProvider(),
            storageManager: storageManager,
            onExit: onExit
        )
    }

    func profileDataProvider() -> ProfileDataProvider {
        ProfileDataProviderImp(apiClient: apiClient)
    }

    func profileCoordinator(onExit: (() -> Void)?) -> ProfileCoordinator {
        ProfileCoordinator(assembly: self, context: .init(onExit: onExit))
    }
}
