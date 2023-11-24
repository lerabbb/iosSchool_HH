//
//  SplashView.swift
//  iosSchool_HH
//
//  Created by student on 13.11.2023.
//

import Foundation
import UIKit

protocol SplashView: UIView {
    func setView()
}

class SplashViewImp: UIView, SplashView {
    @IBOutlet private var splashImageView: UIImageView!

    func setView() {
        splashImageView.image = UIImage(named: "splash-image")
    }
}
