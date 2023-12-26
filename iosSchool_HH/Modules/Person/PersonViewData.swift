//
//  PersonViewData.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import UIKit

struct PersonViewData {
    let photoCellData: PersonPhotoCellData
    let episodeData: [PersonEpisodeCellData]
    let episodeHeader: PersonHeaderViewData

    init(image: UIImage?, episodeUrls: [String]) {
        photoCellData = PersonPhotoCellData(image: image)
        episodeData = episodeUrls.compactMap { PersonEpisodeCellData(url: $0) }
        episodeHeader = PersonHeaderViewData()
    }
}
