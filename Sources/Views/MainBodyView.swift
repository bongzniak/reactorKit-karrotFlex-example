//
//  MainBodyView.swift
//  ReactorKit-KarrotFlex-Example
//
//  Created 조봉기 on 2022/01/21.
//  Copyright © 2022 tmsae. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift
import KarrotFlex
import Then

final class MainBodyView: BaseView, View {
    
    // MARK: Typealias

    typealias Reactor = MainBodyViewReactor
    
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
    
    // MARK: UI
    
    // MARK: Initializing

    override init() {
        super.init()
    }

    convenience init(reactor: Reactor) {
        defer {
            self.reactor = reactor
        }

        self.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure

    override func setupFlexLayout() {
        super.setupFlexLayout()
        
        flex.define {
            FlexCenter($0, option: .XY) {
                FlexItem($0, view: UIView())
                    .width(300)
                    .height(300)
                    .backgroundColor(.red)
            }
        }
    }
    
    // MARK: Binding

    func bind(reactor: Reactor) {

    }
}

extension MainBodyView {
    class func resolve() -> MainBodyView {
        MainBodyView(reactor: Reactor())
    }
}
