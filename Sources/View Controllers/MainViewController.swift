//
//  MainViewController.swift
//  appname
//
//  Created Fernando on 2020/09/30.
//  Copyright © 2020 tmsae. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift

final class MainViewController: BaseViewController, ReactorKit.View {
    
    typealias Reactor = MainViewReactor
    
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
    init(reactor: MainViewReactor) {
        super.init()
        self.reactor = reactor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        logger.verbose("TEST")
    }
    
    override func addViews() {
        super.addViews()
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
    }
    
    // MARK: Binding
    func bind(reactor: MainViewReactor) {
        // Action
        // <#Code#>
        
        // State
        // <#Code#>
    }
}
