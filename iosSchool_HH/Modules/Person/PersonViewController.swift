//
//  PersonViewController.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import UIKit

class PersonViewController<View: PersonViewImp>: BaseViewController<View> {
    private let dataProvider: PersonDataProvider

    init(dataProvider: PersonDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.setView()
    }
}
