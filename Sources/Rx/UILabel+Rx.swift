// 
// UILabel+Rx.swift
// tmsae
// 
// Created by 조봉기 on 2022/01/22.
// Copyright 2022 tmsae. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa
import UIKit
import KarrotFlex

extension Reactive where Base: UILabel {
    public var flexText: Binder<String?> {
        Binder(self.base) { label, text in
            label.text = text
            label.flex.markDirty()
            label.setNeedsLayout()
        }
    }

    public var flexAttributedText: Binder<NSAttributedString?> {
        Binder(self.base) { label, text in
            label.attributedText = text
            label.flex.markDirty()
            label.setNeedsLayout()
        }
    }
}