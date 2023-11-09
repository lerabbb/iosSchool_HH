//
//  ViewController.swift
//  iosSchool_HH
//
//  Created by student on 19.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let generator = CharacterGenerator()

        let characters = (1...5).map { _ in
            generator.generate(name: nil)
        }
        let males = characters.filter { $0.gender == .male }

        let charactersWithA = characters.filter { $0.name.contains("a") }

        let names = ["John", "Paul", "Ann", "Katty", "Ruby"]
        let charactersOne = names.map { generator.generate(name: $0) }

        let episodes = ["episode1", "episode2", "episode3", "episode4"]
        let charactersTwo = episodes.map { episodeName in
            (1...3).map { _ in
                let character = generator.generate(name: nil)
                character.episode = [episodeName]
                return character
            }
        }
        let charactersThree = episodes.compactMap { episodeName in
            (1...3).map { _ in
                let character = generator.generate(name: nil)
                character.episode = [episodeName]
                return character
            }
        }

        let sum = characters.reduce("", { $0 + $1.name })

        printCharactersArray(name: "Characters", characters: characters)
        printCharactersArray(name: "Male characters", characters: males)
        printCharactersArray(name: "Characters with A", characters: charactersWithA)
        printCharactersArray(name: "Characters generated with names", characters: charactersOne)
        for item in charactersTwo {
            printCharactersArray(name: "characters from episode", characters: item)
        }
        for item in charactersThree {
            printCharactersArray(name: "characters from episode", characters: item)
        }
        print("\nSum: \(sum)")
    }
}
