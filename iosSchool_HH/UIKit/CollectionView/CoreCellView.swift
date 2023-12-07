//
//  CoreCellView.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import UIKit

protocol CoreCellView: UICollectionViewCell, CoreNibReusable {
    associatedtype InputData: CoreCellInputData

    static func layoutSection() -> NSCollectionLayoutSection?
    func update(with inputData: InputData)
}
