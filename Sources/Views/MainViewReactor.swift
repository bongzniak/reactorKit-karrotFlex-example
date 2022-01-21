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
    
    typealias Action = NoAction
    typealias Mutation = NoMutation
    
    struct State {
    }
    
    let initialState: State
    
    // MARK: Initializing
    
    init() {
        initialState = State()
    }
}
