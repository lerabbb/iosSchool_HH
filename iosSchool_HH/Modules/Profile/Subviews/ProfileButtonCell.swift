//
//  ProfileLabelCell.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

class ProfileButtonCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var exitLabel: UILabel!

    static func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(40)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 122, leading: 16, bottom: 46, trailing: 16)
        return section
    }

    override func awakeFromNib() {
        clipsToBounds = false
        styleLabel(label: exitLabel)
    }

    func update(with inputData: ProfileButtonCellData) {
    }

    // MARK: - Private

    private func styleLabel(label: UILabel) {
        label.layer.backgroundColor = UIColor(named: "button-color")?.cgColor
        label.layer.cornerRadius = 10

        label.layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 8
        label.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
