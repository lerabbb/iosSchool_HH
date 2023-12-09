//
//  CoreCellInputData.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import Foundation

protocol CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)? { get }
}
