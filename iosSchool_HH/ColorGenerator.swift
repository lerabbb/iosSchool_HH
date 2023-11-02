//
//  ColorGenerator.swift
//  iosSchool_HH
//
//  Created by student on 23.10.2023.
//

import Foundation
import UIKit

struct Color {
    var alpha: Brightness
    let red: Double
    let green: Double
    let blue: Double

    func description() {
        print("R: \(red), alpha: \(alpha.rawValue)")
    }

    init(red: Double, green: Double, blue: Double) {
        self.alpha = .dim
        self.red = red
        self.green = green
        self.blue = blue
    }
}

protocol ColorGeneratorProtocol {
    var alpha: Double { get set }
    var colorCodes: [Double] { get }

    func createColor() -> UIColor

    init(alpha: Double)
}

extension ColorGeneratorProtocol {
    func createColor() -> UIColor {
        return UIColor()
    }
}

class ColorGenerator: ColorGeneratorProtocol {
    var alpha: Double
    var colorCodes: [Double] = [0.0, 51.0, 102.0, 153.0, 204.0, 255.0]
    let whiteColor: UIColor = .white

    required init(alpha: Double) {
        self.alpha = alpha
    }

    func createColor() -> UIColor {
        UIColor(white: 1, alpha: alpha)
    }

    func changeColorCodes(completion: ([Double]) -> Void) {
        completion([])
    }

    func changeColor(completion: () -> [Double]) {
        print(completion())
    }

    func test() {
        changeColorCodes { [weak self] newColorCodes in
            self?.colorCodes = newColorCodes
        }

        changeColor { [weak self] in
            guard let self else {
                return []
            }
            self.colorCodes = [0, 1, 2, 3]
            return self.colorCodes
        }
    }

    func convertToArray<T>(element: T) -> [T] {
        [element]
    }

    func printAlphaOne<Generator>(generator: Generator) where Generator: ColorGeneratorProtocol{
        print(generator.alpha)
    }

    func printAlphaTwo<Generator: ColorGeneratorProtocol>(generator: Generator) {
        print(generator.alpha)
    }

    func printAlphaThree(generator: Any) {
        let gen = generator as? ColorGeneratorProtocol

        guard let gen else {
            return
        }
        print(gen.alpha)
    }
}

enum Brightness: Double {
    case dim = 0.1
    case average = 0.5
    case bright = 1

    func description() -> String {
        switch self {
        case .dim:
            return "тусклый"
        case .average:
            return "средний"
        case .bright:
            return "яркий"
        }
    }

}

class Palette<CustomColor> {
    let colors: [CustomColor]

    init(colors: [CustomColor]) {
        self.colors = colors
    }

}

func myFunc() {
    //reduce
    let arrayInt = [1, 2, 3, 4, 5, 6, 7, 8]
    let resultReduce = arrayInt.reduce(1) { partialResult, element in
        partialResult * element
    }

    //filter
    let result = arrayInt.filter { elem in
        return elem % 2 == 0
    }
    let result1 = arrayInt.filter { $0 % 2 == 0 }

    //map
    let array = [0.1, 0.2, 0.5, 1]
    let generators = array.map { ColorGenerator(alpha: $0)}

    let generators1 = array.map { alpha -> ColorGeneratorProtocol? in //важно!
        guard alpha < 1 else {
            return nil
        }
        return ColorGenerator(alpha: alpha)
    }

    let generators2: [ColorGeneratorProtocol?] = array.map {
        guard $0 < 1 else {
            return nil
        }
        return ColorGenerator(alpha: $0)
    }

    //compactMap
    let test2 = generators2.compactMap { $0 }
    let test3 = generators2.compactMap { $0?.alpha }
    let test4 = generators2.map { $0?.alpha }
}
