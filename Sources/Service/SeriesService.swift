//
//  SeriesService.swift
//  ReactorKit-KarrotFlex-Example
//
//  Created by 조봉기 on 2022/01/21.
//  Copyright © 2022 tmsae. All rights reserved.
//

import Foundation
import RxSwift

protocol SeriesServiceType {
    func loadSeries() -> Single<Series?>
}

final class SeriesService: SeriesServiceType {
    func loadSeries() -> Single<Series?> {
        guard let path = Bundle.main.path(forResource: "Shows", ofType: "plist"),
              let dictArray = NSArray(contentsOfFile: path) as? [[String: AnyObject]] else {
                  return .just(nil)
              }
        
        let shows: [Show] = dictArray.map { Show(item: $0) }
        let series = Series(shows: shows)
        return .just(series)
    }
}
