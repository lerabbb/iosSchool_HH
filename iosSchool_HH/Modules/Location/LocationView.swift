//
//  LocationView.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import UIKit

protocol LocationView: UIView {
    var selectLocation: ((LocationCellData) -> Void)? { get set }
    func setView()
    func update(data: LocationViewData)
}

class LocationViewImp: UIView, LocationView {

    var selectLocation: ((LocationCellData) -> Void)?

    private var viewData: LocationViewData?
    private let tableView = UITableView()

    func setView() {
        backgroundColor = .white

        let imageView = UIImageView()
        imageView.image = UIImage(named: "locations-background")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        let nib = UINib(nibName: LocationCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: LocationCell.className)
        tableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.allowsSelectionDuringEditing = false
        tableView.dataSource = self
        tableView.delegate = self

        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func update(data: LocationViewData) {
        viewData = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension LocationViewImp: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewData?.cellsData.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewData else {
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.className) else {
            return UITableViewCell()
        }
        (cell as? LocationCell)?.data = viewData.cellsData[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate

extension LocationViewImp: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewData else {
            return
        }
        selectLocation?(viewData.cellsData[indexPath.row])
    }
}
