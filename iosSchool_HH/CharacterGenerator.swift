//
//  FirstHomework.swift
//  iosSchool_HH
//
//  Created by student on 25.10.2023.
//

import Foundation

protocol CharacterGeneratorProtocol {
    var names: [String] { get }
    var strings: [String] { get }

    init()
    func generate(name: String?) -> Character
}

class CharacterGenerator: CharacterGeneratorProtocol {
    let names: [String]
    let strings: [String]

    required init() {
        self.names = ["Alice", "Bob", "Caroline", "Den", "Rick", "Maria"]
        self.strings = ["aaa", "bbb", "ccc", "ddd", "eee", "fff"]
    }

    func generate(name: String?) -> Character {
        Character(
            id: Int.random(in: 0..<100),
            name: name ?? getRandomValue(values: names),
            species: getRandomValue(values: strings),
            image: getRandomValue(values: strings),
            url: getRandomValue(values: strings),
            episode: ["ep1"],
            gender: Character.Gender.random(),
            status: Character.Status.random()
        )
    }

    func getRandomValue(values: [String]) -> String {
        values.randomElement() ?? "xxx"
    }

    func generateNameOne(completion: (String) -> Void) {
        completion(getRandomValue(values: strings))
    }

    func generateNameTwo(completion: () -> (String)) {
        print(completion())
    }

    func generateNameTree() -> (String) -> Void {
        {
            print("generateNameThree result: \($0)")
        }
    }

    func generateNameFour() -> (() -> String) {
        { [weak self] in
            let str: String = "generateNameFour result: "

            guard let self else {
                return str + "-"
            }
            return str + self.getRandomValue(values: strings)
        }
    }
}

func printCharactersArray(name: String, characters: [Character]) {
    print("\n\(name)")
    for item in characters {
        item.description()
    }
}
