//
//  ProfileInfoCellData.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

struct ProfileInfoCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let authDate: String?
    let profileColor: UIColor?
    let dateTitle = "Дата входа"
    let colorTitle = "Цвет профиля"

    init(authDate: String?, profileColor: UIColor?) {
        self.selectClosure = nil
        self.authDate = authDate
        self.profileColor = profileColor
    }
}
