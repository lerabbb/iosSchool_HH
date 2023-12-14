//
//  PersonView.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import UIKit

protocol PersonView: UIView {
    func setView()
    func update(data: PersonViewData)
}

class PersonViewImp: UIView, PersonView {

    private var sections: [CoreSection] = []

    private lazy var collectionView: UICollectionView = {
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout()
        )
    }()

    func setView() {
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
//        collectionView.delegate = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func update(data: PersonViewData) {
        sections = [
            Sections.photoSection.create(data: data),
            Sections.episodes.create(data: data)
        ]
        sections .forEach { $0.registrate(collectionView: collectionView) }
        collectionView.reloadData()
    }

    // MARK: - Private

    private enum Sections: Int {
        case photoSection
        case episodes

        func create(data: PersonViewData) -> CoreSection {
            switch self {
            case .photoSection:
                return PersonPhotoSection(cellsData: [data.photoCellData])
            case .episodes:
                return PersonEpisodeSection(cellsData: data.episodeData, headerData: data.episodeHeader)
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

extension PersonViewImp: UICollectionViewDataSource {

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

private extension PersonViewImp {
    typealias PersonPhotoSection = Section<PersonPhotoCell, EmptyReusableView, EmptyReusableView>
    typealias PersonEpisodeSection = Section<PersonEpisodeCell, PersonHeaderView, EmptyReusableView>
}
