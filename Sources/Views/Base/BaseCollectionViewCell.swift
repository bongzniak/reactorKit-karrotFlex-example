// 
// BaseCollectionViewCell.swift
// tmsae
// 
// Created by 조봉기 on 2022/01/22.
// Copyright 2022 tmsae. All rights reserved.
//

import Foundation
import RxSwift

class BaseCollectionViewCell: UICollectionViewCell {

    // MARK: Rx

    var disposeBag = DisposeBag()

    // MARK: Properties

    lazy private(set) var className: String = {
        return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()

    // MARK: Life Cycle

    override init(frame: CGRect) {
        super.init(frame: .zero)

        self.setupFlexLayout()
    }

    deinit {
        logger.verbose("DEINIT: \(self.className)")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        if !self.didSetupConstraints {
            self.setupConstraints()
            self.didSetupConstraints = true
        }
        super.layoutSubviews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        disposeBag = DisposeBag()
    }

    // MARK: configure

    func setupFlexLayout() {
    }
}
