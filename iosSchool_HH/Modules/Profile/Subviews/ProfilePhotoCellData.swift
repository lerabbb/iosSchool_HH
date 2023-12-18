//
//  ProfilePhotoCellData.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

struct ProfilePhotoCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let image: UIImage?

    init(image: UIImage?, selectClosure: ((CoreCellInputData) -> Void)?) {
        self.selectClosure = selectClosure
        self.image = image
    }
}
