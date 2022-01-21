//
//  MainBodyViewReactor.swift
//  ReactorKit-KarrotFlex-Example
//
//  Created 조봉기 on 2022/01/21.
//  Copyright © 2022 tmsae. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

class MainBodyViewReactor: Reactor {
    
    enum Action {
        case updateSeries(Series)
        case updateShow(Show)
    }
    
    enum Mutation {
        case setSeries(Series)
        case setShow(Show)
    }
   
    struct State {
        var showPopularity: Int = 0
        var showYear: String = ""
        var showRating: String = ""
        var showLength: String = ""

        var episodeURL: URL?
        var episode: String = ""
        var episodeTitle: String = ""
        var episodeDescription: String = ""

        var showCast: String = ""
        var showCreators: String = ""

        var sections: [SeriesSection] = []
    }
    
    let initialState = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            case .updateSeries(let series):
                return .just(.setSeries(series))

            case .updateShow(let show):
                 return .just(.setShow(show))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
            case .setSeries(let series):
                state.showPopularity = series.showPopularity
                state.showYear = series.showYear
                state.showRating = series.showRating
                state.showLength = series.showLength

                state.episodeURL = series.shows.first?.url
                state.episode = series.shows.first?.episode ?? ""
                state.episodeTitle = series.shows.first?.title ?? ""
                state.episodeDescription = series.shows.first?.detail ?? ""

                state.showCast = series.showCast
                state.showCreators = series.showCreators

                let sectionItems = series.shows.map { show -> SeriesSectionItem in
                    .episode(EpisodeCellReactor(show: show))
                }
                state.sections = [.section(sectionItems)]

            case .setShow(let show):
                state.episodeURL = show.url
                state.episode = show.episode
                state.episodeTitle = show.title
                state.episodeDescription = show.detail
        }
        
        return state
    }
}

