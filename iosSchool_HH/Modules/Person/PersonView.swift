//
//  PersonView.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import UIKit

protocol PersonView: UIView {
    func setView()
}

class PersonViewImp: UIView, PersonView {

    func setView() {
        backgroundColor = .red
    }
}
