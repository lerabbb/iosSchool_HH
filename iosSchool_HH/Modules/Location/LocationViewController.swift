//
//  LocationViewController.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import UIKit

class LocationViewController: UIViewController {

    private let dataProvider: LocationDataProvider

    init(dataProvider: LocationDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        findAllLocations()
    }

    func findAllLocations() {
        dataProvider.findAllLocations(onRequestCompleted: { list, error in
            print(list ?? "no list")
            print(error?.rawValue ?? "no error")
        })
    }
}
