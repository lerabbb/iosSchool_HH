//
//  ProfileLoginCellData.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import Foundation

struct ProfileLoginCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let login: String

    init(login: String?) {
        self.login = login ?? ""
    }
}
