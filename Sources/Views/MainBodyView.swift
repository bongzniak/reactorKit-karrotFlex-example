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
import RxDataSources
import ReusableKit
import KarrotFlex
import Then

final class MainBodyView: BaseView, View {
    
    // MARK: Typealias

    typealias Reactor = MainBodyViewReactor
    typealias RxDataSource = RxCollectionViewSectionedReloadDataSource<SeriesSection>
    
    // MARK: Constants

    private enum Metric {
        static let padding: CGFloat = 8
        static let paddingHorizontal: CGFloat = 8.0
        static let summaryImageViewRatio: CGFloat = 16/9
    }

    private enum Font {
        static let episodeLabel: UIFont = .boldSystemFont(ofSize: 16.0)
        static let episodeTitleLabel: UIFont = .boldSystemFont(ofSize: 16.0)
        static let descriptionLabel: UIFont = .systemFont(ofSize: 14.0)
        static let castLabel: UIFont = .boldSystemFont(ofSize: 14.0)
        static let creatorLabel: UIFont = .boldSystemFont(ofSize: 14.0)
        static let episodeBarLabel: UIFont = .boldSystemFont(ofSize: 14.0)
    }

    private enum Color {
        static let popularityLabel: UIColor = .red
    }

    private enum Localized {
        static let cast: String = "Cast"
        static let creators: String = "Creators"
        static let episode: String = "EPISODE"
    }

    private enum Reusable {
        static let episodeCell = ReusableCell<EpisodeCell>()
    }

    // MARK: Properties

    var dataSource: RxDataSource!
    
    // MARK: UI

    let scrollView = UIScrollView()
    let contentView = UIView()

    let summaryImageView: UIImageView = UIImageView()
    let popularityLabel: UILabel = UILabel().then {
        $0.textColor = Color.popularityLabel
    }
    let yearLabel: UILabel = UILabel()
    let ratingLabel: UILabel = UILabel()
    let lengthLabel: UILabel = UILabel()

    let episodeLabel: UILabel = UILabel().then {
        $0.font = Font.episodeLabel
    }
    let episodeTitleLabel: UILabel = UILabel().then {
        $0.font = Font.episodeTitleLabel
    }
    let descriptionLabel: UILabel = UILabel().then {
        $0.font = Font.descriptionLabel
        $0.numberOfLines = 3
    }
    let castLabel: UILabel = UILabel().then {
        $0.font = Font.castLabel
    }
    let creatorLabel: UILabel = UILabel().then {
        $0.font = Font.creatorLabel
    }

    let episodeBarLabel: UILabel = UILabel().then {
        $0.text = Localized.episode
        $0.font = Font.episodeBarLabel
    }

    let collectionView = UICollectionView(
        frame: CGRect.zero,
        collectionViewLayout: UICollectionViewFlowLayout().then { $0.scrollDirection = .vertical }
    ).then {
        $0.bounces = false
        $0.isScrollEnabled = false

        $0.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)

        $0.register(Reusable.episodeCell)
    }

    var collectionViewFlex: Flex?


    // MARK: Initializing

    override init() {
        super.init()

        addSubview(scrollView)
        scrollView.addSubview(contentView)

        dataSource = dataSourceFactory()
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
    
    override func layoutSubviews() {
        super.layoutSubviews()

        scrollView.pin.all()
        contentView.pin.top().left().right()

        contentView.flex.layout(mode: .adjustHeight)

        scrollView.contentSize = contentView.frame.size
    }
    
    // MARK: Configure

    override func setupFlexLayout() {
        super.setupFlexLayout()

        let textSize = Localized.episode.size(
            withAttributes: [NSAttributedString.Key.font: Font.episodeBarLabel]
        )

        contentView.flex.define {
            FlexItem($0, view: self.summaryImageView)
                .aspectRatio(Metric.summaryImageViewRatio)
                .backgroundColor(.lightGray)

            FlexHStack($0) {
                FlexItem($0, view: self.popularityLabel)
                    .grow(1)
                FlexHStack($0, justifyContent: .spaceBetween) {
                    FlexItem($0, view: self.yearLabel)
                    FlexItem($0, view: self.ratingLabel)
                    FlexItem($0, view: self.lengthLabel)
                }
                    .grow(2)
                FlexItem($0, view: UILabel())
                    .grow(1)
                    .width(20%)
            }
                .padding(Metric.padding)

            FlexHStack($0) {
                FlexItem($0, view: self.episodeLabel)
                FlexSpacer($0, spacing: 20)
                FlexItem($0, view: self.episodeTitleLabel)
            }
                .padding(Metric.padding)

            FlexVStack($0) {
                FlexItem($0, view: self.descriptionLabel)
                FlexSpacer($0, spacing: 4)
                FlexItem($0, view: self.castLabel)
                FlexSpacer($0, spacing: 4)
                FlexItem($0, view: self.creatorLabel)
            }
                .padding(Metric.padding)

            FlexVStack($0) {
                FlexItem($0, view: UIView())
                    .width(textSize.width)
                    .height(3.0)
                    .backgroundColor(.red)
                FlexSpacer($0, spacing: 2)
                FlexItem($0, view: self.episodeBarLabel)
            }
                .padding(Metric.padding)

            FlexItem($0, view: collectionView)
                .grow(1)
                .register(&collectionViewFlex)
        }
    }
    
    // MARK: Binding

    func bind(reactor: Reactor) {

        // View

        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)

        collectionView.rx.observe(CGSize.self, "contentSize")
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] size in
                self?.collectionViewFlex?.height(size?.height)
                self?.setNeedsLayout()
            })
            .disposed(by: self.disposeBag)

        // Action

        collectionView.rx.itemSelected(dataSource: dataSource)
            .subscribe(onNext:{ [weak self] sectionItem in
                guard let self = self else { return }
                switch sectionItem {
                    case .episode(let reactor):
                        self.reactor?.action.onNext(.updateShow(reactor.show))
                        self.setNeedsLayout()
                }
            })
            .disposed(by: self.disposeBag)

        // State

        reactor.state.map {
                $0.sections
            }
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        reactor.state.map {
                $0.episodeURL
            }
            .bind(to: summaryImageView.rx.imageURL)
            .disposed(by: disposeBag)

        reactor.state.map {
                String(repeating: "★", count: $0.showPopularity)
            }
            .distinctUntilChanged()
            .bind(to: popularityLabel.rx.flexText)
            .disposed(by: disposeBag)

        reactor.state.map {
                $0.showYear
            }
            .distinctUntilChanged()
            .bind(to: yearLabel.rx.flexText)
            .disposed(by: disposeBag)

        reactor.state.map {
                $0.showRating
            }
            .distinctUntilChanged()
            .bind(to: ratingLabel.rx.flexText)
            .disposed(by: disposeBag)

        reactor.state.map {
                $0.showLength
            }
            .distinctUntilChanged()
            .bind(to: lengthLabel.rx.flexText)
            .disposed(by: disposeBag)

        reactor.state.map {
                $0.episode
            }
            .distinctUntilChanged()
            .bind(to: episodeLabel.rx.flexText)
            .disposed(by: disposeBag)

        reactor.state.map {
                $0.episodeTitle
            }
            .distinctUntilChanged()
            .bind(to: episodeTitleLabel.rx.flexText)
            .disposed(by: disposeBag)

        reactor.state.map {
                $0.episodeDescription
            }
            .distinctUntilChanged()
            .bind(to: descriptionLabel.rx.flexText)
            .disposed(by: disposeBag)

        reactor.state.map {
                 "\(Localized.cast): \($0.showCast)"
            }
            .distinctUntilChanged()
            .bind(to: castLabel.rx.flexText)
            .disposed(by: disposeBag)

        reactor.state.map {
                "\(Localized.creators): \($0.showCreators)"
            }
            .distinctUntilChanged()
            .bind(to: creatorLabel.rx.flexText)
            .disposed(by: disposeBag)
    }
    
    func bind(action: Reactor.Action) {
        reactor?.action.onNext(action)
    }
}

extension MainBodyView {
    private func dataSourceFactory() -> RxDataSource {
        RxDataSource(
            configureCell: { (_, collectionView, indexPath, sectionItem) in
                switch sectionItem {
                    case .episode(let reactor):
                        return collectionView.dequeue(Reusable.episodeCell, for: indexPath).then {
                            $0.reactor = reactor
                        }
                }
            }
        )
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension MainBodyView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let sectionItem = dataSource[indexPath.section].items[indexPath.item]
        let width = collectionView.frame.width
            - collectionView.contentInset.left
            - collectionView.contentInset.right
        switch sectionItem {
            case .episode:
                return Reusable.episodeCell.class.size(width: width)
        }
    }
}

extension MainBodyView {
    class func resolve() -> MainBodyView {
        MainBodyView(reactor: Reactor())
    }
}
