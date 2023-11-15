//
//  CharacterViewController.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import UIKit

class CharacterViewController: UIViewController {

    private let dataProvider: CharacterDataProvider

    init(dataProvider: CharacterDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        findSingleCharacter()
    }

    func findSingleCharacter() {
        dataProvider.findSingleCharacter(
            url: "https://rickandmortyapi.com/api/character/71"
        ) { character, error in
            print(character?.description() ?? "no character")
            print(error?.rawValue ?? "no error")
        }
    }
}
