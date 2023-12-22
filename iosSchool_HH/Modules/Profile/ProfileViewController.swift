//
//  ProfileViewController.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit
import PKHUD
import SPIndicator

class ProfileViewController<View: ProfileView>: BaseViewController<View> {

    private var onExit: (() -> Void)?
    private let dataProvider: ProfileDataProvider
    private let storageManager: StorageManager

    init(
        dataProvider: ProfileDataProvider,
        storageManager: StorageManager,
        onExit: (() -> Void)?
    ) {
        self.dataProvider = dataProvider
        self.storageManager = storageManager
        self.onExit = onExit

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.setView()
        let infoCells = [
            ProfileInfoCellData(
                infoType: .date,
                authDate: self.storageManager.getLastAuthDate(),
                profileColor: nil
            ),
            ProfileInfoCellData(
                infoType: .color,
                authDate: nil,
                profileColor: UIColor(named: "iceberg-color")
            )
        ]
        rootView.update(data: .init(
            smallAvatarImg: UIImage(named: "user-profile"),
            largeAvatarImg: UIImage(named: "profile-background"),
            profile: nil,
            infoCells: infoCells,
            selectExit: { [weak self] _ in
                self?.storageManager.removeToken()
                self?.onExit?()
            })
        )
        HUD.show(.progress)
        guard let userId = storageManager.getToken()?.userId else {
            self.showFail(error: "token not found")
            return
        }

        self.dataProvider.findSingleProfile(id: userId) { [weak self] profile, error in
            guard let profile else {
                self?.showFail(error: error?.rawValue ?? "")
                return
            }
            DispatchQueue.main.async {
                HUD.hide()
                self?.rootView.updateLogin(data: ProfileLoginCellData(login: profile.username))
            }
        }
    }

    // MARK: - Private

    private func showFail(error: String) {
        HUD.hide()
        SPIndicator.present(title: error, haptic: .error)
        rootView.updatePhoto(data: ProfilePhotoCellData(smallAvatarImg: nil, largeAvatarImg: nil))
    }
}
