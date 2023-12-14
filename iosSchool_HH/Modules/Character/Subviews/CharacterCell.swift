//
//  CharacterCell.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import UIKit
import PKHUD

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
        section.contentInsets = NSDirectionalEdgeInsets(top: 59, leading: 16, bottom: 0, trailing: 16)
        return section
    }

    override func awakeFromNib() {
        self.layer.cornerRadius = 15
        self.layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 8
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.clipsToBounds = false
        indicator.hidesWhenStopped = true
        imageView.contentMode = .scaleAspectFit
    }

    func update(with inputData: CharacterCellData) {
        if inputData.isLoading {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
        nameLabel.text = inputData.name ?? ""
        infoLabel.text = inputData.info ?? ""
        imageView.image = inputData.image ?? UIImage(named: "placeholder")
    }

}
