//
//  ProfileInfoCell.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

class ProfileInfoCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var dateInfoView: UIView!
    @IBOutlet private weak var colorInfoView: UIView!
    @IBOutlet private weak var dateTitleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var colorTitleLabel: UILabel!
    @IBOutlet private weak var colorView: UIView!

    static func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(98)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 32, bottom: 0, trailing: 32)
        return section
    }

    override func awakeFromNib() {
        clipsToBounds = false
        styleInfoView(view: dateInfoView)
        styleInfoView(view: colorInfoView)
        styleColorView(view: colorView)
        styleLabel(label: dateTitleLabel)
        styleLabel(label: dateLabel)
        styleLabel(label: colorTitleLabel)
    }

    func update(with inputData: ProfileInfoCellData) {
        dateTitleLabel.text = inputData.dateTitle
        colorTitleLabel.text = inputData.colorTitle
        dateLabel.text = inputData.authDate
        colorView.backgroundColor = inputData.profileColor ?? UIColor(named: "iceberg-color")
    }

    // MARK: - Private

    private func styleInfoView(view: UIView) {
        view.layer.backgroundColor = UIColor(.white).cgColor
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(.black).cgColor

        view.layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    private func styleColorView(view: UIView) {
        view.layer.cornerRadius = view.frame.width/2
    }

    private func styleLabel(label: UILabel) {
        label.textColor =  UIColor(named: "placeholder-color") ?? UIColor(.black)
    }
}
