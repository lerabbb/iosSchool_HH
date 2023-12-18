//
//  ProfileViewController.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

class ProfileViewController<View: ProfileView>: BaseViewController<View> {
    var onExit: (() -> Void)?

    private let dataProvider: ProfileDataProvider
    private let storageManager: StorageManager

    init(
        dataProvider: ProfileDataProvider,
        storageManager: StorageManager
    ) {
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
        rootView.update(data: .init(
            image: UIImage(named: "user-profile"),
            profile: nil,
            lastAuthDate: storageManager.getLastAuthDate(),
            profileColor: nil,
            selectExit: nil
        ))

        let selectClosure: ((CoreCellInputData) -> Void)? = { [weak self] _ in
            self?.storageManager.removeToken()
            self?.onExit?()
        }
        rootView.updateButton(data: ProfileButtonCellData(selectClosure: selectClosure))

        guard let userId = storageManager.getToken()?.userId else {
            return
        }
        DispatchQueue.global().async {
            self.dataProvider.findSingleProfile(id: userId) { [weak self] profile, _ in
                guard let profile else {
                    return
                }
                DispatchQueue.main.async {
                    self?.rootView.updateLogin(data: ProfileLoginCellData(
                        profile: profile,
                        selectClosure: nil
                    ))
                }
            }
        }
    }
}
