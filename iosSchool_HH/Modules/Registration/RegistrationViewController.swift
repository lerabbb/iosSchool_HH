//
//  File.swift
//  iosSchool_HH
//
//  Created by student on 09.11.2023.
//

import UIKit
import PKHUD
import SPIndicator

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

    var onOpenAuth: (() -> Void)?

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
        rootView.delegate = self
    }
}

// MARK: - RegistrationViewDelegate

extension RegistrationViewController: RegistrationViewDelegate {

    func registrationButtonDidTap(login: String, password: String) {
        HUD.show(.progress)
        dataProvider.registration(user: User(username: login, password: password)) { [weak self] token, error in
            DispatchQueue.main.async {
                HUD.hide()
            }
            guard let self, token != nil else {
                DispatchQueue.main.async {
                    SPIndicator.present(title: error?.rawValue ?? "", haptic: .error)
                }
                return
            }
            self.onRegistrationSuccess?()
        }
//        HUD.show(.progress)
//        dataProvider.register(...) { [weak self] token, error in
//            ...
//            self.storageManager.saveToken(token: token)
//            self.onOpenLogin?()
//        }
        // after success registration go to locations, (save token)
    }

    func backButtonDidTap() {
        dismiss(animated: true)
    }
}
