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

    init(smallAvatarImg: UIImage?, largeAvatarImg: UIImage?) {
        self.smallAvatarImg = smallAvatarImg ?? UIImage(named: "placeholder")
        self.largeAvatarImg = largeAvatarImg ?? UIImage(named: "placeholder")
    }
}
