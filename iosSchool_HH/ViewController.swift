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

        let generator1: CharacterGenerator = CharacterGenerator(
            values: ["abcd", "efg", "hijk"]
        )

        let generator2: CharacterGeneratorProtocol = CharacterGenerator(
            values: ["bbb", "ccc", "nnn"]
        )

        let character1 = generator1.generate()
        let character2 = generator2.generate()
    }
}
