//
//  Series.swift
//  ReactorKit-KarrotFlex-Example
//
//  Created by 조봉기 on 2022/01/21.
//  Copyright © 2022 tmsae. All rights reserved.
//

import Foundation

struct Series: Equatable {
    let id: Int = 1
    let url: URL? = URL(string: "")
    let showPopularity: Int = 5
    let showYear: String = "2010"
    let showRating: String = "TV-14"
    let showLength: String = "3 Series"
    let selectedShow: String = "S3:E3"
    let showCast: String = "Benedict Cumberbatch, Martin Freeman, Una Stubbs"
    let showCreators: String = "Mark Gatiss, Steven Moffat"
    let shows: [Show]
    
    static func == (lhs: Series, rhs: Series) -> Bool {
        lhs.id == rhs.id
    }
}
