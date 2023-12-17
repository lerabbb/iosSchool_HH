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

    init(image: UIImage?, selectClosure: ( (CoreCellInputData) -> Void)?) {
        self.selectClosure = selectClosure
        self.image = image
        self.isLoading = (image == nil) ? true : false
    }
}
