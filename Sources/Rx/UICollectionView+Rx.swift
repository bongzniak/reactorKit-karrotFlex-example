// 
// UICollectionView+Rx.swift
// tmsae
// 
// Created by 조봉기 on 2022/01/22.
// Copyright 2022 tmsae. All rights reserved.
//

import Foundation

import RxCocoa
import RxDataSources
import RxSwift

extension Reactive where Base: UICollectionView {
    func itemSelected<S>(dataSource: CollectionViewSectionedDataSource<S>) -> ControlEvent<S.Item> {
        let source = itemSelected.map { indexPath in
            dataSource[indexPath]
        }
        return ControlEvent(events: source)
    }
}