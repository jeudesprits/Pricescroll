//
//  DSCVCollectionViewController.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/22/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import UIKit

final class DSCVCollectionViewController: UICollectionViewController {
    
    typealias DataSource  = UICollectionViewDiffableDataSource<DSCVCollectionView.Section, Int>
    
    var dataSource: DataSource!
    
    override func loadView() {
        collectionView = DSCVCollectionView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
        title = "Обзор"
    }
    
    private func configureCell<T: UICollectionViewCell & Identifiable>(type cellType: T.Type, in collectionView: UICollectionView, for indexPath: IndexPath, with closure: ((T) -> Void)? = nil) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Cannot create new cell")
        }
        
        closure?(cell)
        
        return cell
    }
    
    private func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView) { (collectionView, indexPath, identifier) in
            if indexPath.section == 0 {
                return self.configureCell(type: DSCVFeed1CollectionViewCell.self, in: collectionView, for: indexPath)
            } else if indexPath.section == 1 {
                return self.configureCell(type: DSCVFeed2CollectionViewCell.self, in: collectionView, for: indexPath)
            } else if indexPath.section == 2 {
                return self.configureCell(type: DSCVFeed3CollectionViewCell.self, in: collectionView, for: indexPath)
            } else if indexPath.section == 3 {
                return self.configureCell(type: DSCVFeed2CollectionViewCell.self, in: collectionView, for: indexPath)
            } else if indexPath.section == 4 {
                return self.configureCell(type: DSCVFeed4CollectionViewCell.self, in: collectionView, for: indexPath)
            } else {
                return self.configureCell(type: DSCVFeed5CollectionViewCell.self, in: collectionView, for: indexPath)
            }
        }
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                             ofKind: kind,
                withReuseIdentifier: DSCVTitleSupplementaryView.reuseIdentifier,
                                for: indexPath
            ) as? DSCVTitleSupplementaryView else { fatalError() }
            
            return supplementaryView
        }
        
        let snapshot = NSDiffableDataSourceSnapshot<DSCVCollectionView.Section, Int>()
        snapshot.appendSections([.Feed1, .Feed2, .Feed3, .Feed4, .Feed5, .Feed6])
        snapshot.appendItems([Int](0...4), toSection: .Feed1)
        snapshot.appendItems([Int](5...9), toSection: .Feed2)
        snapshot.appendItems([Int](10...14), toSection: .Feed3)
        snapshot.appendItems([Int](15...30), toSection: .Feed4)
        snapshot.appendItems([Int](31...35), toSection: .Feed5)
        snapshot.appendItems([Int](36...40), toSection: .Feed6)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
