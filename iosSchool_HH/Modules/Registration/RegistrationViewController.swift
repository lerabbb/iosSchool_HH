//
//  File.swift
//  iosSchool_HH
//
//  Created by student on 09.11.2023.
//

import Foundation
import UIKit

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

    private let dataProvider: RegistrationDataProvider
    private var onRegistrationSuccess: (() -> Void)?
    private let storageManager: StorageManager

    init(dataProvider: RegistrationDataProvider, storageManager: StorageManager, onRegistrationSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.onRegistrationSuccess = onRegistrationSuccess
        self.storageManager = storageManager

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.setView()
    }

    func register() {
        dataProvider.registration(user: User(username: "lera", password: "12345678")) { token, error in
            print(token ?? "no token. registration failed")
            print(error?.rawValue ?? "no error. registration success")
        }
//        HUD.show(.progress)
//        dataProvider.register(...) { [weak self] token, error in
//            ...
//            self.storageManager.saveToken(token: token)
//            self.onOpenLogin?()
//        }
        // after success registration go to locations, (save token)
    }
}
