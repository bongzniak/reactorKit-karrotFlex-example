//
//  BaseNavigationController.swift
//
//  Created by Fernando on 2020/01/05.
//  Copyright © 2020 tmsae. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    // MARK: Properties
    
    lazy private(set) var className: String = {
        return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    // MARK: Initialize
    
    deinit {
        logger.verbose("DEINIT: \(self.className)")
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        self.navigationBar.prefersLargeTitles = true
    }
}
