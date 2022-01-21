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
    
    private struct Metric {
    }
    
    private struct Color {
    }
    
    private struct Font {
    }
    
    private struct Localized {
        
    }
    
    // MARK: Properties
    
    // MARK: Initializing
    
    init(reactor: Reactor, view: MainBodyView) {
        super.init(view: view)
        self.reactor = reactor
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
            reactor: Reactor(),
            view: MainBodyView.resolve()
        )
    }
}
