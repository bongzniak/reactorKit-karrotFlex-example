//
//  EpisodeCell.swift
//  ReactorKit-KarrotFlex-Example
//
//  Created by 조봉기 on 2022/01/22.
//  Copyright © 2022 tmsae. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift
import KarrotFlex
import Then

final class EpisodeCell: BaseCollectionViewCell, View {
    
    typealias Reactor = EpisodeCellReactor
    
    enum Metric {
        static let imageViewWidth: CGFloat = Metric.height * (16/9)
        static let height: CGFloat = 100.0
    }

    enum Font {
        static let episode: UIFont = .boldSystemFont(ofSize: 14.0)
        static let title: UIFont = .systemFont(ofSize: 14.0)
        static let length: UIFont = .systemFont(ofSize: 12.0)
    }
        
    // MARK: Properties
    
    // MARK: UI Views

    let imageView: UIImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    let titleLabel: UILabel = UILabel()
    let lengthLabel: UILabel = UILabel().then {
        $0.font = Font.length
    }

    // MARK: - Life cycle

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.flex.layout()
    }

    // MARK: - UI Setup
    override func setupFlexLayout() {
        super.setupFlexLayout()

        contentView.flex.define {
            FlexHStack($0, alignItems: .center) {
                FlexItem($0, view: self.imageView)
                    .width(Metric.imageViewWidth)
                    .height(Metric.height)
                FlexSpacer($0, spacing: 10)
                FlexVStack($0, justifyContent: .center) {
                    FlexItem($0, view: self.titleLabel)
                    FlexSpacer($0, spacing: 4)
                    FlexItem($0, view: self.lengthLabel)
                }
            }
        }
    }

    // MARK: - Binding

    func bind(reactor: Reactor) {

        // State

        reactor.state.map {
                $0.url
            }
            .distinctUntilChanged()
            .bind(to: imageView.rx.imageURL)
            .disposed(by: disposeBag)

        reactor.state.map {
                ($0.episode, $0.title)
            }
            .distinctUntilChanged { (lhs: (String, String), rhs: (String, String)) -> Bool in
                lhs.0 == rhs.0 && lhs.1 == rhs.1
            }
            .map { [weak self] (episode: String, title: String) -> NSAttributedString? in
                self?.titleAttributedString(episode: episode, title: title)
            }
            .bind(to: titleLabel.rx.flexAttributedText)
            .disposed(by: disposeBag)

        reactor.state.map {
                $0.length
            }
            .distinctUntilChanged()
            .bind(to: lengthLabel.rx.flexText)
            .disposed(by: disposeBag)
    }

    private func titleAttributedString(episode: String, title: String) -> NSAttributedString {
        let episodeAttributedString = NSMutableAttributedString(string: "")
        episodeAttributedString.append(NSMutableAttributedString(string: episode).font(Font.episode))
        episodeAttributedString.append(NSMutableAttributedString(string: " • ").font(Font.title))
        episodeAttributedString.append(NSMutableAttributedString(string: title).font(Font.title))
        return episodeAttributedString
    }
}

extension EpisodeCell {
    class func size(width: CGFloat) -> CGSize {
        CGSize(width: width, height: Metric.height)
    }
}
