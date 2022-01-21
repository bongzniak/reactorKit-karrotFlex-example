//
//  Show.swift
//  ReactorKit-KarrotFlex-Example
//
//  Created by 조봉기 on 2022/01/21.
//  Copyright © 2022 tmsae. All rights reserved.
//

import Foundation

struct Show {
    let title: String
    let length: String
    let detail: String
    let url: URL?
    let showPopularity: Int
    
    init(item: [String: AnyObject]) {
        guard
            let title = item["title"] as? String,
            let length = item["length"] as? String,
            let detail = item["detail"] as? String,
            let image = item["image"] as? String,
            let showPopularity = item["showPopularity"] as? Int
        else {
            fatalError("Error parsing dict \(item)")
        }
        
        self.title = title
        self.length = length
        self.detail = detail
        self.url = URL(string: image)
        self.showPopularity = showPopularity
    }
}
