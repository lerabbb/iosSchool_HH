//
//  File.swift
//  iosSchool_HH
//
//  Created by student on 09.11.2023.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {

    private let dataProvider: RegistrationDataProvider

    init(dataProvider: RegistrationDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        register()
    }

    func register() {
        dataProvider.registration(username: "lera", password: "12345678") { token, error in
            print(token ?? "no token. registration failed")
            print(error?.rawValue ?? "no error. registration success")
        }
    }
}
