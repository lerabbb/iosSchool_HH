//
//  ProfileButtonCell.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

class ProfileButtonCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var exitButton: UIButton!

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
        styleButton(button: exitButton)
    }

    func update(with inputData: ProfileButtonCellData) {
        exitButton.titleLabel?.text = inputData.exitTitle
    }

    // MARK: - Private

    private func styleButton(button: UIButton) {
        button.layer.backgroundColor = UIColor(named: "button-color")?.cgColor
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = UIColor(.white)

        button.layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 8
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
