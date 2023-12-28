//
//  NSObject+ClassName.swift
//  iosSchool_HH
//
//  Created by student on 27.11.2023.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: Self.self)
    }
}
