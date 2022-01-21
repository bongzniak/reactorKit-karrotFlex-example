//
//  BaseViewController.swift
//
//  Created by Fernando on 27/09/2019.
//  Copyright © 2019 tmsae. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import RxOptional
import Then 

class BaseViewController<View: UIView>: UIViewController {
    
    var disposeBag = DisposeBag()
    
    // MARK: Properties
    
    let bodyView: View
    
    lazy private(set) var className: String = {
        return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    private(set) var didSetupConstraints = false
    
    // MARK:
    
    init(view: View) {
        self.bodyView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init() {
        self.init(view: View())
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    deinit {
        print("DEINIT: \(self.className)")
    }
    
    // MARK: View Lifecycle
    
    override func loadView() {
        super.loadView()
        
        self.view = bodyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: Configure
    
    func setupFlexLayout() {
        
    }
}
