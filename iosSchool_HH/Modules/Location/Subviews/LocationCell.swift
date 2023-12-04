//
//  LocationCell.swift
//  iosSchool_HH
//
//  Created by student on 27.11.2023.
//

import UIKit

class LocationCell: UITableViewCell {

    var data: LocationCellData? {
        didSet {
            guard let data else {
                return
            }
            update(data: data)
        }
    }

    @IBOutlet private weak var nameLabel: UILabel!

    // MARK: - Private

    private func update(data: LocationCellData) {
        nameLabel.text = data.name
    }
}
