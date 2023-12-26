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
        tabBar.backgroundColor = UIColor(named: "iceberg-color")
        tabBar.isTranslucent = false
        tabBar.tintColor = .clear
    }
}
