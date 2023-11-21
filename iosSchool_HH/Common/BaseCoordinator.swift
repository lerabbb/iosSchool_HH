//
//  BaseCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 06.11.2023.
//

import UIKit

class BaseCoordinator<Context> {
    let assembly: Assembly
    let context: Context

    init(assembly: Assembly, context: Context) {
        self.assembly = assembly
        self.context = context
    }

    func make() -> UIViewController? {
        fatalError("This method is abstract")
    }
}
