//
//  DSCVFeed3CollectionViewCell.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/25/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import UIKit

final class DSCVFeed3CollectionViewCell: UICollectionViewCell, Identifiable {
    
    private lazy var illustration: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.backgroundColor = .systemBlue
        $0.layer.allowsEdgeAntialiasing = true
        $0.layer.cornerRadius = 8.0
        return $0
    }(UIImageView(frame: .zero))
    
    private lazy var title: UILabel = {
        $0.text = "New Fire 🔥"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .body)
        $0.textColor = .label
        return $0
    }(UILabel(frame: .zero))
    
    lazy var subtitle: UILabel = {
        $0.text = "Rattle your speakers with new" // 🔥 from Cuso, HAWA, and Noga Erez."
        $0.numberOfLines = 2
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .footnote)
        $0.textColor = .secondaryLabel
        return $0
    }(UILabel(frame: .zero))
    
    private func setupIllustrationConstraints() {
        contentView.addSubview(illustration)
        
        NSLayoutConstraint.activate([
            illustration.topAnchor.constraint(equalTo: contentView.topAnchor),
            illustration.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            illustration.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            illustration.heightAnchor.constraint(equalTo: illustration.widthAnchor, multiplier: 1.0),
        ])
    }
    
    private func setupTitleConstraints() {
        contentView.addSubview(title)
        
        title.setContentHuggingPriority(.required, for: .vertical)
        title.setContentCompressionResistancePriority(.required, for: .vertical)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: illustration.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func setupSubtitleConstraints() {
        contentView.addSubview(subtitle)
        
        subtitle.setContentHuggingPriority(.required, for: .vertical)
        subtitle.setContentCompressionResistancePriority(.required, for: .vertical)
        
        let bottomAnchor = subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomAnchor.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor),
            subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomAnchor,
        ])
    }
    
    private func setupConstraints() {
        setupIllustrationConstraints()
        setupTitleConstraints()
        setupSubtitleConstraints()
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
