//
//  ProfilePhotoCellData.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

struct ProfilePhotoCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let smallAvatarImg: UIImage?
    let largeAvatarImg: UIImage?
}
