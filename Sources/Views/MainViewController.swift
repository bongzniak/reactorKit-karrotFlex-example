//
//  MainViewController.swift
//  ReactorKit-KarrotFlex-Example
//
//  Created Fernando on 2020/09/30.
//  Copyright © 2020 tmsae. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift

final class MainViewController: BaseViewController<MainBodyView>, ReactorKit.View {
    
    // MARK: typealias
    
    typealias Reactor = MainViewReactor
    
    // MARK: Constants
    
    // MARK: Properties
    
    // MARK: Initializing
    
    init(reactor: Reactor, view: MainBodyView) {
        defer {
            self.reactor = reactor
        }
        
        super.init(view: view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Binding
    
    func bind(reactor: Reactor) {
        // Action
        
        // State
    }
}

extension MainViewController {
    class func resolve() -> MainViewController {
        MainViewController(
            reactor: Reactor(seriesService: SeriesService()),
            view: MainBodyView.resolve()
        )
    }
}
