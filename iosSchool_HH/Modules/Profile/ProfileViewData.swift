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
    let infoCellData: ProfileInfoCellData
    let buttonCellData: ProfileButtonCellData

    init(
        image: UIImage?,
        profile: Profile?,
        lastAuthDate: String?,
        profileColor: UIColor?,
        selectExit: ((CoreCellInputData) -> Void)?
    ) {
        self.photoCellData = ProfilePhotoCellData(image: image, selectClosure: nil)
        self.loginCellData = ProfileLoginCellData(profile: profile, selectClosure: nil)
        self.infoCellData = ProfileInfoCellData(authDate: lastAuthDate, profileColor: profileColor, selectClosure: nil)
        self.buttonCellData = ProfileButtonCellData(selectClosure: selectExit)
    }
}
