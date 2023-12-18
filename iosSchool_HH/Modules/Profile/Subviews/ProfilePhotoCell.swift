//
//  ProfilePhotoCell.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

class ProfilePhotoCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var photoImageView: UIImageView!

    static func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(377)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return section
    }

    override func awakeFromNib() {
        backgroundImageView.image = UIImage(named: "profile-background")
        backgroundImageView.contentMode = .scaleAspectFill
    }

    func update(with inputData: ProfilePhotoCellData) {
        photoImageView.image = inputData.image ?? UIImage(named: "placeholder")
        photoImageView.contentMode = .scaleAspectFill
    }
}
