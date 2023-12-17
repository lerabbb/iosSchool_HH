//
//  ProfileView.swift
//  iosSchool_HH
//
//  Created by student on 18.12.2023.
//

import UIKit

protocol ProfileView: UIView {
    var delegate: ProfileViewDelegate? { get set }

    func setView()
}

protocol ProfileViewDelegate: AnyObject {
    func exitButtonDidTap()
}

class ProfileViewImp: UIView, ProfileView {

    weak var delegate: ProfileViewDelegate?

    func setView() {
        backgroundColor = UIColor(named: "grey-color")
    }
}
