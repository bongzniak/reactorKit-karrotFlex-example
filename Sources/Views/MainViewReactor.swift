//
//  MainViewReactor.swift
//  ReactorKit-KarrotFlex-Example
//
//  Created Fernando on 2020/09/30.
//  Copyright © 2020 tmsae. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

final class MainViewReactor: Reactor {
    
    enum Action {
        case load
    }
    
    enum Mutation {
        case setSeries(Series?)
    }
    
    struct State {
        var series: Series?
    }
    
    let initialState: State

    // MARK: Properties
    
    let seriesService: SeriesServiceType
    
    // MARK: Initializing
    
    init(seriesService: SeriesServiceType) {
        self.seriesService = seriesService
        
        initialState = State()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            case .load:
                return loadSeries()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
            case .setSeries(let series):
                state.series = series
        }
        
        return state
    }
    
    func loadSeries() -> Observable<Mutation> {
        seriesService
            .loadSeries()
            .asObservable()
            .map {
                return .setSeries($0)
            }
    }
}
