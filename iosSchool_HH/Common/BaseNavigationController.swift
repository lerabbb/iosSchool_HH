//
//  BaseNavigationController.swift
//  iosSchool_HH
//
//  Created by student on 23.11.2023.
//

import UIKit

class BaseNavigationController: UINavigationController, UINavigationControllerDelegate,
    UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.prefersLargeTitles = false
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor(named: "iceberg-color")
        navigationBar.layer.masksToBounds = false
        navigationBar.layer.shadowColor = UIColor(named: "shadow-color")?.cgColor
        navigationBar.layer.shadowOpacity = 1
        navigationBar.layer.shadowRadius = 8
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.backgroundColor = UIColor(named: "iceberg-color")
    }

    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }

    // MARK: - UIGestureRecognizerDelegate

    func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}
