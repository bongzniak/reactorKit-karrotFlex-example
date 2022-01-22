//
//  BaseView.swift
//  ReactorKit-KarrotFlex-Example
//
//  Created by 조봉기 on 2022/01/21.
//  Copyright © 2022 tmsae. All rights reserved.
//

import Foundation
import UIKit

import RxSwift
import RxCocoa
import Then

class BaseView: UIView {
    
    // MARK: Properties
    
    var disposeBag = DisposeBag()
    
    // MARK: Properties
    
    lazy private(set) var className: String = {
        return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    // MARK: Life Cycle
    
    deinit {
        logger.verbose("DEINIT: \(self.className)")
    }
    
    init() {
        super.init(frame: .zero)
        
        setupFlexLayout()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    // MARK: configure
    
    func setupFlexLayout() {    
    }
}
