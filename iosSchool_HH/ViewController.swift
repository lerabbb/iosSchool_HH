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

        let generator = CharacterGenerator(values: ["hhh", "eee", "aaa", "ddd", "sss"])

        generator.generateNameOne(completion: {
            print("generateNameOne result: \($0)")
        })

        generator.generateNameTwo(completion: { [generator] in
            return "generateNameTwo result: \(generator.values[1])"
        })

        let closureThree = generator.generateNameTree()
        closureThree(generator.getRandomString())

        let closureFour = generator.generateNameFour()
        print(closureFour())

    }
}
