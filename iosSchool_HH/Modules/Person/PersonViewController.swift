//
//  PersonViewController.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import UIKit

class PersonViewController<View: PersonViewImp>: BaseViewController<View> {
    private let dataProvider: PersonDataProvider
    private let episodes: [String]
    private let imageUrl: String
    private let imageService: ImageService

    init(dataProvider: PersonDataProvider, data: CharacterCellData, imageService: ImageService) {
        self.dataProvider = dataProvider
        self.episodes = data.episodes
        self.imageUrl = data.imageUrl ?? ""
        self.imageService = imageService
        super.init(nibName: nil, bundle: nil)
        title = data.name
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.setView()
        rootView.update(data: .init(image: nil, episodeUrls: episodes))

        DispatchQueue.global().async {
            self.imageService.getImage(url: self.imageUrl) { image in
                DispatchQueue.main.async {
                    self.rootView.updatePhoto(with: PersonPhotoCellData(
                        image: image,
                        selectClosure: nil
                    ))
                }
            }
        }

        episodes.enumerated().forEach { idx, url in
            DispatchQueue.global().async {
                self.dataProvider.findSingleEpisode(url: url) { [weak self] episode, _ in
                    guard let episode else {
                        return
                    }
                    guard let cellData = PersonEpisodeCellData(episode: episode, selectClosure: nil) else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.rootView.updateEpisode(idx: idx, with: cellData)
                    }
                }
            }
        }
    }
}
