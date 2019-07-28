//
//  DSCVFeed1CollectionViewCell.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/23/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import UIKit

final class DSCVFeed1CollectionViewCell: UICollectionViewCell, Identifiable {
    
    private lazy var illustration: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .center
        $0.backgroundColor = .systemPurple
        $0.layer.allowsEdgeAntialiasing = true
        $0.layer.cornerRadius = 8.0
        return $0
    }(UIImageView(frame: .zero))
    
    private func setupIllustrationConstraints() {
        contentView.addSubview(illustration)
        NSLayoutConstraint.activate([
            illustration.topAnchor.constraint(equalTo: contentView.topAnchor),
            illustration.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            illustration.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            illustration.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    private func setupConstraints() {
        setupIllustrationConstraints()
    }
    
    override static var requiresConstraintBasedLayout: Bool { true }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
