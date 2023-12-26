//
//  CharacterCell.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import UIKit

class CharacterCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var indicator: UIActivityIndicatorView!

    static func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .absolute(167)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(167)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 2
        )
        group.interItemSpacing = .fixed(24)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 30
        section.contentInsets = NSDirectionalEdgeInsets(top: 59, leading: 16, bottom: 71, trailing: 16)
        return section
    }

    override func awakeFromNib() {
        layer.cornerRadius = 15
        layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
        clipsToBounds = false
        indicator.hidesWhenStopped = true
        imageView.contentMode = .scaleAspectFit
    }

    func update(with inputData: CharacterCellData) {
        if inputData.isLoading {
            indicator.startAnimating()
            imageView.layer.opacity = 0.6
        } else {
            indicator.stopAnimating()
            imageView.layer.opacity = 1
        }
        nameLabel.text = inputData.name ?? ""
        infoLabel.text = inputData.info ?? ""
        imageView.image = inputData.image ?? UIImage(named: "placeholder")
    }
}
