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
        dataProvider.findAllLocations { [weak self] list, _ in
            guard let list else {
                return
            }
            self?.rootView.update(data: LocationViewData(list: list))
        }
    }

    private func setupBar() {
        title = "Выбор планеты"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 18)
        ]
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "refresh"),
            style: .plain,
            target: self,
            action: #selector(reload)
        )
    }

    @objc
    private func reload() {
        findAllLocations()
    }
}
