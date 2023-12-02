//
//  TabBarController.swift
//  iosSchool_HH
//
//  Created by student on 23.11.2023.
//

import UIKit

class TabBarController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        tabBar.layer.shadowOpacity = 1
        tabBar.layer.shadowRadius = 8
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 5)
        tabBar.backgroundColor = UIColor(named: "iceberg-color")
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
    }
}
