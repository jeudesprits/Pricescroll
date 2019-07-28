//
//  DSCVCollectionView.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/22/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import UIKit

final class DSCVCollectionView: UICollectionView {
    
    enum Section: CaseIterable { case Feed1, Feed2, Feed3, Feed4 }
    
    private func setupAppearance() {
        backgroundColor = .systemBackground
    }
    
    private func registerReusableViews() {
        register(
                                        DSCVFeed1CollectionViewCell.self,
            forCellWithReuseIdentifier: DSCVFeed1CollectionViewCell.reuseIdentifier
        )
        register(
                                        DSCVFeed2CollectionViewCell.self,
            forCellWithReuseIdentifier: DSCVFeed2CollectionViewCell.reuseIdentifier
        )
        register(
                                        DSCVFeed3CollectionViewCell.self,
            forCellWithReuseIdentifier: DSCVFeed3CollectionViewCell.reuseIdentifier
        )
        register(
                                        DSCVTitleSupplementaryView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionTitle,
                   withReuseIdentifier: DSCVTitleSupplementaryView.reuseIdentifier
        )
    }
    
    init(frame: CGRect) {
        super.init(frame: frame, collectionViewLayout: Self.createLayout())
        
        setupAppearance()
        registerReusableViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DSCVCollectionView {
    
    private static func createFeed1ItemsInvalidationHandler(withInterGroupSpacing interGroupSpacing: CGFloat, sectionTopInset: CGFloat) -> NSCollectionLayoutSectionVisibleItemsInvalidationHandler {
        { items, offset, layoutEnvironment in
            items.forEach {
                guard $0.representedElementCategory == .cell else { return }
                let diff = abs($0.center.x - (offset.x + interGroupSpacing + $0.bounds.width / 2.0))
                let normDiff = min(diff, $0.bounds.width + interGroupSpacing)
                let dy = (1.0 - ($0.bounds.width + interGroupSpacing - normDiff) /
                         ($0.bounds.width + interGroupSpacing)) * 30.0
                $0.center.y = sectionTopInset + $0.bounds.width / 2.0 + dy
            }
        }
    }
    
    private static func createFeed1Section(with layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupWidth = layoutEnvironment.container.effectiveContentSize.width - 2.0 * CGFloat(20.0)
        let groupSize = NSCollectionLayoutSize(
             widthDimension: .absolute(groupWidth),
            heightDimension: .absolute(groupWidth)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 20.0, trailing: 20.0)
        section.orthogonalScrollingBehavior = .groupPaging
        section.visibleItemsInvalidationHandler = createFeed1ItemsInvalidationHandler(
            withInterGroupSpacing: section.interGroupSpacing,
                  sectionTopInset: section.contentInsets.top
        )
        
        return section
    }
    
    private static func createFeed2Section(with layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemGroupWidth = layoutEnvironment.container.effectiveContentSize.width - 2.0 * 20.0
        let itemEstimatedHeight = (itemGroupWidth - 10.0) / 2.0
        
        let itemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(0.5),
            heightDimension: .estimated(itemEstimatedHeight)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
             widthDimension: .absolute(itemGroupWidth),
            heightDimension: .estimated(itemEstimatedHeight)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(10.0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    private static func createFeed3Section(with layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemGroupWidth = layoutEnvironment.container.effectiveContentSize.width - 2.0 * 20.0
        let itemEstimatedHeight = (itemGroupWidth - 10.0) / 2.0
        
        let itemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(itemEstimatedHeight)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
             widthDimension: .absolute(itemGroupWidth),
            heightDimension: .estimated(itemEstimatedHeight)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.interItemSpacing = .fixed(10.0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private static func createFeed4Section(with layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemGroupWidth = layoutEnvironment.container.effectiveContentSize.width - 2.0 * 20.0
        let itemEstimatedHeight = (itemGroupWidth - 10.0) / 2.0
        
        let itemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(0.4),
            heightDimension: .estimated(itemEstimatedHeight)
        )
        let item1 = NSCollectionLayoutItem(layoutSize: itemSize)
        let item2 = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let subgroupSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(itemEstimatedHeight)
        )
        let subgroup1 = NSCollectionLayoutGroup.horizontal(layoutSize: subgroupSize, subitems: [item1])
        subgroup1.interItemSpacing = .fixed(10.0)
        
        let subgroup2 = NSCollectionLayoutGroup.horizontal(layoutSize: subgroupSize, subitems: [item2])
        subgroup2.interItemSpacing = .fixed(10.0)

        let groupSize = NSCollectionLayoutSize(
             widthDimension: .absolute(itemGroupWidth),
            heightDimension: .estimated(itemGroupWidth)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [subgroup1, subgroup2])
        group.interItemSpacing = .fixed(10.0)
        
        print(group.visualDescription())
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private static func createLayout() -> UICollectionViewLayout {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { (sectionIndex, layoutEnvironment) in
            switch sectionIndex {
            case 20:
                return createFeed1Section(with: layoutEnvironment)
            case 0:
                return createFeed2Section(with: layoutEnvironment)
            case 1:
                return createFeed3Section(with: layoutEnvironment)
            case 2:
                return createFeed4Section(with: layoutEnvironment)
            default:
                return nil
            }
        }
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 0.0
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: configuration)
        
        return layout
    }
    
}
