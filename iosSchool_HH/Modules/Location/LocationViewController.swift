//
//  LocationViewController.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import UIKit

class LocationViewController<View: LocationViewImp>: BaseViewController<View> {

    var selectLocation: ((LocationCellData) -> Void)?

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
        setupBar()
        rootView.setView()
        rootView.selectLocation = selectLocation
        findAllLocations()
    }

// MARK: - Private

    private func findAllLocations() {
        dataProvider.findAllLocations { [weak self] list, error in
            guard let list else {
                print(error?.rawValue ?? "no error")
                return
            }
            print(list)

            self?.rootView.update(data: LocationViewData(list: list))
        }
    }

    private func setupBar() {
            title = "Выбор планеты"
            navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor(named: "DarkBlue") ?? .black,
                .font: UIFont.systemFont(ofSize: 18)
            ]
//            navigationItem.rightBarButtonItem = UIBarButtonItem(
//                barButtonSystemItem: .refresh,
//                target: self,
//                action: #selector(reload)
//            )
        }
}
