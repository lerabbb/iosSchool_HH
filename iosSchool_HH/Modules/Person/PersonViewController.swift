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

    init(dataProvider: PersonDataProvider, data: CharacterCellData) {
        self.dataProvider = dataProvider
        self.episodes = data.episodes
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.setView()
        rootView.update(data: .init(image: nil, episodeUrls: episodes))
    }
}
