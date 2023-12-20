//
//  ProfileView.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

protocol ProfileView: UIView {
    func setView()
    func update(data: ProfileViewData)
    func updateLogin(data: ProfileLoginCellData)
}

class ProfileViewImp: UIView, ProfileView {

    private var sections: [CoreSection] = []

    private lazy var collectionView: UICollectionView = {
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout()
        )
    }()

    func setView() {
        backgroundColor = UIColor(named: "grey-color")
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func update(data: ProfileViewData) {
        sections = [
            Sections.photoSection.create(data: data),
            Sections.loginSection.create(data: data),
            Sections.infoSection.create(data: data),
            Sections.buttonSection.create(data: data)
        ]
        sections.forEach { $0.registrate(collectionView: collectionView) }
        collectionView.reloadData()
    }

    func updateLogin(data: ProfileLoginCellData) {
        let sectionNum = Sections.loginSection.rawValue
        sections[sectionNum].updateCell(at: IndexPath(item: 0, section: sectionNum), with: data)
        guard let cell = sections[sectionNum].cell(
            collectionView: collectionView,
            indexPath: IndexPath(item: 0, section: sectionNum)
        ) as? ProfileLoginCell else {
            return
        }
        cell.update(with: data)
    }

    // MARK: - Private

    private enum Sections: Int {
        case photoSection
        case loginSection
        case infoSection
        case buttonSection

        func create(data: ProfileViewData) -> CoreSection {
            switch self {
            case .photoSection:
                return ProfilePhotoSection(cellsData: [data.photoCellData])
            case .loginSection:
                return ProfileLoginSection(cellsData: [data.loginCellData])
            case .infoSection:
                return ProfileInfoSection(cellsData: [data.infoCellData])
            case .buttonSection:
                return ProfileButtonSection(cellsData: [data.buttonCellData])
            }
        }
    }

    private func layout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [unowned self] section, env -> NSCollectionLayoutSection? in
            guard let layoutSection = sections[section].sectionLayoutProvider?(section, env) else {
                return nil
            }
            return layoutSection
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ProfileViewImp: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        sections[section].numberOfItem
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        sections[indexPath.section].cell(
            collectionView: collectionView,
            indexPath: indexPath
        ) ?? UICollectionViewCell()
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        sections[indexPath.section].reusableView(
            collectionView: collectionView,
            indexPath: indexPath,
            kind: kind
        ) ?? UICollectionReusableView()
    }
}

// MARK: - UICollectionViewDelegate

extension ProfileViewImp: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].selectCell(at: indexPath.item)
    }
}

private extension ProfileViewImp {
    typealias ProfilePhotoSection = Section<ProfilePhotoCell, EmptyReusableView, EmptyReusableView>
    typealias ProfileLoginSection = Section<ProfileLoginCell, EmptyReusableView, EmptyReusableView>
    typealias ProfileInfoSection = Section<ProfileInfoCell, EmptyReusableView, EmptyReusableView>
    typealias ProfileButtonSection = Section<ProfileButtonCell, EmptyReusableView, EmptyReusableView>
}
