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
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var populationLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!

    // MARK: - Private

    private func update(data: LocationCellData) {
        nameLabel.text = data.name
        typeLabel.text = data.type
        populationLabel.text = data.population

        arrowImageView.image = UIImage(named: "arrow")
        arrowImageView.contentMode = .scaleAspectFill
        backgroundColor = .clear
    }
}
