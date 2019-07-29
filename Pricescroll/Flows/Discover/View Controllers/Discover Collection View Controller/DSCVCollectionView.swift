//
//  DSCVCollectionView.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/22/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import UIKit

final class DSCVCollectionView: UICollectionView {
    
    enum Section: CaseIterable { case Feed1, Feed2, Feed3, Feed4, Feed5, Feed6, Feed7, Feed8 }
    
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
                                        DSCVFeed4CollectionViewCell.self,
            forCellWithReuseIdentifier: DSCVFeed4CollectionViewCell.reuseIdentifier
        )
        register(
                                        DSCVFeed5CollectionViewCell.self,
            forCellWithReuseIdentifier: DSCVFeed5CollectionViewCell.reuseIdentifier
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
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupWidth = layoutEnvironment.container.effectiveContentSize.width - 2.0 * 20.0
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
        let groupWidth = (layoutEnvironment.container.effectiveContentSize.width - 2.0 * 20.0 - 10.0) / 2.0
        
        let itemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(groupWidth)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
             widthDimension: .absolute(groupWidth),
            heightDimension: .estimated(groupWidth)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let boundarySupplementaryItemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(0.85),
            heightDimension: .estimated(44.0)
        )
        let titleBoundarySupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
             layoutSize: boundarySupplementaryItemSize,
            elementKind: UICollectionView.elementKindSectionTitle,
              alignment: .topLeading
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [titleBoundarySupplementaryItem]
        section.interGroupSpacing = 10.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    private static func createFeed3Section(with layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let groupWidth = layoutEnvironment.container.effectiveContentSize.width - 2.0 * 20.0
        let itemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(groupWidth)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
             widthDimension: .absolute(groupWidth),
            heightDimension: .estimated(groupWidth)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let boundarySupplementaryItemSize = NSCollectionLayoutSize(
                   widthDimension: .fractionalWidth(0.85),
                  heightDimension: .estimated(44.0)
        )
        let titleBoundarySupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
                   layoutSize: boundarySupplementaryItemSize,
                  elementKind: UICollectionView.elementKindSectionTitle,
                    alignment: .topLeading
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [titleBoundarySupplementaryItem]
        section.interGroupSpacing = 10.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 20.0, trailing: 20.0)
        section.orthogonalScrollingBehavior = .groupPaging

        return section
    }
    
    private static func createFeed4Section(with layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let groupWidth = layoutEnvironment.container.effectiveContentSize.width - 2.0 * 20.0
        let itemWidth = (groupWidth - 10.0) / 2.0
        
        let itemSize = NSCollectionLayoutSize(
             widthDimension: .absolute(itemWidth),
            heightDimension: .estimated(itemWidth)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let subgroupSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(itemWidth)
        )
        let topSubgroup = NSCollectionLayoutGroup.horizontal(layoutSize: subgroupSize, subitems: [item])
        topSubgroup.interItemSpacing = .fixed(10.0)
        
        let bottomSubgroup = NSCollectionLayoutGroup.horizontal(layoutSize: subgroupSize, subitems: [item])
        bottomSubgroup.interItemSpacing = .fixed(10.0)
        
        let groupSize = NSCollectionLayoutSize(
             widthDimension: .absolute(groupWidth),
            heightDimension: .estimated(groupWidth)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [topSubgroup, bottomSubgroup])
        group.interItemSpacing = .fixed(10.0)
        
        let boundarySupplementaryItemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(0.85),
            heightDimension: .estimated(44.0)
        )
        let titleBoundarySupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
             layoutSize: boundarySupplementaryItemSize,
            elementKind: UICollectionView.elementKindSectionTitle,
              alignment: .topLeading
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [titleBoundarySupplementaryItem]
        section.interGroupSpacing = 10.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private static func createFeed5Section(with layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupWidth = layoutEnvironment.container.effectiveContentSize.width - 2 * 20.0
        let groupSize = NSCollectionLayoutSize(
             widthDimension: .absolute(groupWidth),
            heightDimension: .fractionalWidth(0.5)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(10.0)
        
        let boundarySupplementaryItemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(0.85),
            heightDimension: .estimated(44.0)
        )
        let titleBoundarySupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: boundarySupplementaryItemSize,
           elementKind: UICollectionView.elementKindSectionTitle,
             alignment: .topLeading
        )
       
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [titleBoundarySupplementaryItem]
        section.interGroupSpacing = 10.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        section.orthogonalScrollingBehavior = .groupPaging
       
        return section
    }
    
    private static func createFeed6Section(with layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let boundarySupplementaryItemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(0.85),
            heightDimension: .estimated(44.0)
        )
        let titleBoundarySupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
             layoutSize: boundarySupplementaryItemSize,
            elementKind: UICollectionView.elementKindSectionTitle,
              alignment: .topLeading
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [titleBoundarySupplementaryItem]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        
        return section
    }
    
    private static func createFeed7Section(with layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let groupWidth = layoutEnvironment.container.effectiveContentSize.width - 2.0 * 20.0
        let itemWidth = (groupWidth - 2 * 10.0) / 3.0
        
        let itemSize = NSCollectionLayoutSize(
             widthDimension: .absolute(itemWidth),
            heightDimension: .estimated(itemWidth)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let subgroupSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(itemWidth)
        )
        let topSubgroup = NSCollectionLayoutGroup.horizontal(layoutSize: subgroupSize, subitems: [item])
        topSubgroup.interItemSpacing = .fixed(10.0)
        
        let bottomSubgroup = NSCollectionLayoutGroup.horizontal(layoutSize: subgroupSize, subitems: [item])
        bottomSubgroup.interItemSpacing = .fixed(10.0)
        
        let groupSize = NSCollectionLayoutSize(
             widthDimension: .absolute(groupWidth),
            heightDimension: .estimated(groupWidth)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [topSubgroup, bottomSubgroup])
        group.interItemSpacing = .fixed(10.0)
        
        let boundarySupplementaryItemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(0.85),
            heightDimension: .estimated(44.0)
        )
        let titleBoundarySupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
             layoutSize: boundarySupplementaryItemSize,
            elementKind: UICollectionView.elementKindSectionTitle,
              alignment: .topLeading
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [titleBoundarySupplementaryItem]
        section.interGroupSpacing = 10.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    private static func createFeed8Section(with layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let groupWidth = layoutEnvironment.container.effectiveContentSize.width - 2.0 * 20.0
        let trailingItemWidth = (groupWidth - 2 * 20.0) / 3.0
        let leadingItemWidth =  trailingItemWidth * 2.0 + 20.0
        
        let leadingItemSize = NSCollectionLayoutSize(
             widthDimension: .absolute(leadingItemWidth),
            heightDimension: .absolute(leadingItemWidth)
        )
        let leadingItem = NSCollectionLayoutItem(layoutSize: leadingItemSize)
        
        let trailingItemSize = NSCollectionLayoutSize(
              widthDimension: .fractionalWidth(1.0),
             heightDimension: .fractionalHeight(0.5)
        )
        let trailingItem = NSCollectionLayoutItem(layoutSize: trailingItemSize)
        
        let trailingGroupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(trailingItemWidth),
            heightDimension: .fractionalHeight(1.0)
        )
        let trailingGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: trailingGroupSize,
               subitem: trailingItem,
                 count: 2
        )
        trailingGroup.interItemSpacing = .fixed(20.0)
        
        let groupSize = NSCollectionLayoutSize(
             widthDimension: .absolute(groupWidth),
            heightDimension: .absolute(trailingItemWidth * 2.0 + 20.0)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [leadingItem, trailingGroup])
        group.interItemSpacing = .fixed(20.0)
        
        let boundarySupplementaryItemSize = NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(0.85),
            heightDimension: .estimated(44.0)
        )
        let titleBoundarySupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(
             layoutSize: boundarySupplementaryItemSize,
            elementKind: UICollectionView.elementKindSectionTitle,
              alignment: .topLeading
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [titleBoundarySupplementaryItem]
        section.interGroupSpacing = 20.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        
        return section
    }
    
    private static func createLayout() -> UICollectionViewLayout {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { (sectionIndex, layoutEnvironment) in
            switch sectionIndex {
            case 0:
                return createFeed1Section(with: layoutEnvironment)
            case 1:
                return createFeed2Section(with: layoutEnvironment)
            case 2:
                return createFeed3Section(with: layoutEnvironment)
            case 3:
                return createFeed4Section(with: layoutEnvironment)
            case 4:
                return createFeed5Section(with: layoutEnvironment)
            case 5:
                return createFeed6Section(with: layoutEnvironment)
            case 6:
                return createFeed7Section(with: layoutEnvironment)
            case 7:
                return createFeed8Section(with: layoutEnvironment)
            default:
                return nil
            }
        }
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 10.0
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: configuration)
        
        return layout
    }
    
}
