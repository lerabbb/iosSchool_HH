//
//  PersonEpisodeCell.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import UIKit

class PersonEpisodeCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var numberView: UIView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var airDateLabel: UILabel!

    static func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(127),
            heightDimension: .absolute(127)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(127),
            heightDimension: .absolute(127)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 26
        section.contentInsets = NSDirectionalEdgeInsets(top: 33, leading: 16, bottom: 50, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    override func awakeFromNib() {
        layer.cornerRadius = 15
        layer.backgroundColor = UIColor(named: "iceberg-color")?.cgColor
        numberView.backgroundColor = UIColor(named: "light-green-color")
        numberView.layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        numberView.layer.shadowOpacity = 1
        numberView.layer.shadowRadius = 4
        numberView.layer.shadowOffset = CGSize(width: 0, height: 4)
        numberView.layer.cornerRadius = numberView.frame.width/2
    }

    func update(with inputData: PersonEpisodeCellData) {
        numberLabel.text = inputData.number
        nameLabel.text = inputData.name ?? ""
        airDateLabel.text = inputData.airDate ?? ""
    }
}
