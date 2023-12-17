//
//  ProfileViewController.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

class ProfileViewController<View: ProfileView>: BaseViewController<View> {

    private let dataProvider: ProfileDataProvider
    private let storageManager: StorageManager

    init(dataProvider: ProfileDataProvider, storageManager: StorageManager) {
        self.dataProvider = dataProvider
        self.storageManager = storageManager

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.setView()
        rootView.delegate = self
    }
}

// MARK: - AuthViewDelegate

extension ProfileViewController: ProfileViewDelegate {
    func exitButtonDidTap() {
    }
}

