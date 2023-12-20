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
        self.photoCellData = ProfilePhotoCellData(image: image)
        self.loginCellData = ProfileLoginCellData(profile: profile)
        self.infoCellData = ProfileInfoCellData(authDate: lastAuthDate, profileColor: profileColor)
        self.buttonCellData = ProfileButtonCellData(selectClosure: selectExit)
    }
}
