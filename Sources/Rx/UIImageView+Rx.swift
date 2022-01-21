// 
// UIImageView+Rx.swift
// tmsae
// 
// Created by 조봉기 on 2022/01/22.
// Copyright 2022 tmsae. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

import Kingfisher

extension Reactive where Base: UIImageView {

    public var imageURL: Binder<URL?> {
        self.imageURL(withPlaceholder: nil)
    }

    public func imageURL(withPlaceholder placeholderImage: UIImage?) -> Binder<URL?> {
        Binder(base, binding: { (imageView, url) in
            imageView.kf.setImage(
                with: url,
                placeholder: placeholderImage,
                options: [
                    KingfisherOptionsInfoItem.cacheOriginalImage,
                    KingfisherOptionsInfoItem.scaleFactor(UIScreen.main.scale),
                    KingfisherOptionsInfoItem.transition(.fade(1))
                ]
            )
        })
    }
}
