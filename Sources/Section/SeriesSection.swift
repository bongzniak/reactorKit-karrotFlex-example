// 
// SeriesSection.swift
// tmsae
// 
// Created by 조봉기 on 2022/01/22.
// Copyright 2022 tmsae. All rights reserved.
//

import Foundation

import RxDataSources

enum SeriesSection {
    case section([SeriesSectionItem])
}

extension SeriesSection: SectionModelType {
    typealias Item = SeriesSectionItem

    var items: [Item] {
        switch self {
            case .section(let items):
                return items
        }
    }

    init(original: SeriesSection, items: [Item]) {
        switch original {
            case .section:
                self = .section(items)
        }
    }
}

enum SeriesSectionItem {
    case episode(EpisodeCellReactor)
}
