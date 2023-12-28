//
//  ProfileViewData.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

struct ProfileViewData {
    let photoCellData: ProfilePhotoCellData
    let loginCellData: ProfileLoginCellData
    let infoCells: [ProfileInfoCellData]
    let buttonCellData: ProfileButtonCellData

    init(
        smallAvatarImg: UIImage?,
        largeAvatarImg: UIImage?,
        profile: Profile?,
        infoCells: [ProfileInfoCellData],
        selectExit: ((CoreCellInputData) -> Void)?
    ) {
        self.photoCellData = ProfilePhotoCellData(smallAvatarImg: smallAvatarImg, largeAvatarImg: largeAvatarImg)
        self.loginCellData = ProfileLoginCellData(login: profile?.username)
        self.infoCells = infoCells
        self.buttonCellData = ProfileButtonCellData(selectClosure: selectExit)
    }
}
