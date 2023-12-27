//
//  PersonPhotoCellData.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import UIKit

struct PersonPhotoCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let isLoading: Bool
    let image: UIImage?

    init(image: UIImage?) {
        self.image = image ?? UIImage(named: "placeholder")
        self.isLoading = image == nil
    }
}
