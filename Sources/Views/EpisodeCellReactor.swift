//
//  EpisodeCellReactor.swift
//  ReactorKit-KarrotFlex-Example
//
//  Created by 조봉기 on 2022/01/22.
//  Copyright © 2022 tmsae. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

class EpisodeCellReactor: Reactor {
    
    typealias Action = NoAction
    typealias Mutation = NoMutation

    struct State {
        let url: URL?
        let episode: String
        let title: String
        let length: String
    }

    let show: Show
    
    let initialState: State

    init(show: Show) {
        self.show = show

        initialState = State(
            url: show.url,
            episode: show.episode,
            title: show.title,
            length: show.length
        )
    }
}
