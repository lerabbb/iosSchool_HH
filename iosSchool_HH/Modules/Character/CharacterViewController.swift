//
//  CharacterViewController.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import UIKit

class CharacterViewController<View: CharacterView>: BaseViewController<View> {

    var selectCharacter: ((CharacterCellData) -> Void)?

    private var characters: [Character] = []
    private let dataProvider: CharacterDataProvider
    private let charactersUrlList: [String]
    private let updateQueue = DispatchQueue(label: "CharacterRequestQueue")
    private let imageService: ImageService

    init(dataProvider: CharacterDataProvider, data: LocationCellData, imageService: ImageService) {
        self.dataProvider = dataProvider
        self.charactersUrlList = data.residents
        self.imageService = imageService
        super.init(nibName: nil, bundle: nil)
        title = "Жители локации \(data.name)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        rootView.setView()
        rootView.update(data: CharacterViewData(cells: charactersUrlList.map {
            CharacterCellData(url: $0)
        }))

        let selectClosure: ((CoreCellInputData) -> Void)? = { [weak self] data in
            guard let data = data as? CharacterCellData else {
                return
            }
            self?.selectCharacter?(data)
        }

        charactersUrlList.enumerated().forEach { idx, url in
            requestCharacter(url: url) { [weak self] character in
                guard let self else {
                    return
                }
                DispatchQueue.main.async {
                    self.rootView.updateCharacter(idx: idx, with: CharacterCellData(
                        character: character,
                        isLoading: true,
                        image: nil,
                        selectClosure: selectClosure
                    ))
                }
                self.imageService.getImage(url: character.image, completion: { [weak self] image in
                    DispatchQueue.main.async {
                        self?.rootView.updateCharacter(idx: idx, with: CharacterCellData(
                            character: character,
                            isLoading: false,
                            image: image,
                            selectClosure: selectClosure
                        ))
                    }
                })
            }
        }
    }

    // MARK: - Private

    private func requestCharacter(url: String, completion: @escaping (Character) -> Void) {
        if let character = characters.first(where: { $0.url == url }) {
            completion(character)
            return
        }
        DispatchQueue.global().async {
            self.dataProvider.findSingleCharacter(url: url) { [weak self] character, _ in
                guard let character else {
                    return
                }
                self?.updateQueue.async {
                    self?.characters.append(character)
                    completion(character)
                }
            }
        }
    }
}
