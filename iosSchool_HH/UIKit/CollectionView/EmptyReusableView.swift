//
//  CoreReusableView.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import UIKit

class EmptyReusableView: UICollectionReusableView, CoreReusableView {

    static func layoutItem() -> NSCollectionLayoutBoundarySupplementaryItem? {
        nil
    }

    func update(with _: Void) -> Self {
        self
    }
}
