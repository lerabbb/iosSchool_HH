//
//  PersonEpisodeCellData.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import Foundation

struct PersonEpisodeCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let number: String
    let name: String?
    let airDate: String?

    init?(url: String) {
        guard let url = URL(string: url) else {
            return nil
        }
        number = url.lastPathComponent
        name = nil
        airDate = nil
    }

    init?(episode: Episode) {
        guard let url = URL(string: episode.url) else {
            return nil
        }
        number = url.lastPathComponent
        name = episode.name
        airDate = episode.airDate
    }
}
