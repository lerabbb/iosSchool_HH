//
//  PersonPhotoCell.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import UIKit

class PersonPhotoCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var indicator: UIActivityIndicatorView!

    static func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 37, leading: 16, bottom: 84, trailing: 16)
        return section
    }

    override func awakeFromNib() {
        backgroundColor = UIColor(named: "iceberg-color")
        layer.cornerRadius = 15
        layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.masksToBounds = false
        clipsToBounds = false
        indicator.hidesWhenStopped = true
        imageView.contentMode = .scaleAspectFit
    }

    func update(with inputData: PersonPhotoCellData) {
        if inputData.isLoading {
            indicator.startAnimating()
            imageView.layer.opacity = 0.6
        } else {
            indicator.stopAnimating()
            imageView.layer.opacity = 1
        }
        imageView.image = inputData.image
    }
}
