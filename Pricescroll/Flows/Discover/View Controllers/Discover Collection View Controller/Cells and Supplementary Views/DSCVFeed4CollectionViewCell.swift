//
//  DSCVFeed4CollectionViewCell.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/28/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import UIKit

final class DSCVFeed4CollectionViewCell: UICollectionViewCell, Identifiable {
    
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
        $0.numberOfLines = 2
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .body)
        $0.textColor = .label
        return $0
    }(UILabel(frame: .zero))
    
    private lazy var subtitle: UILabel = {
        $0.text = "Rattle your speakers with new 🔥 from Cuso, HAWA, and Noga Erez."
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .footnote)
        $0.textColor = .secondaryLabel
        return $0
    }(UILabel(frame: .zero))
    
    private lazy var price: UILabel = {
        $0.text = "$9.99"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .headline)
        $0.textColor = .systemBlue
        $0.backgroundColor = .secondarySystemFill
        $0.layer.allowsEdgeAntialiasing = true
        return $0
    }(UILabel(frame: .zero))
    
    private func setupIllustrationConstraints() {
        contentView.addSubview(illustration)
        
        NSLayoutConstraint.activate([
            illustration.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1.0),
            illustration.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: illustration.bottomAnchor, multiplier: 1.0),
            illustration.widthAnchor.constraint(equalTo: illustration.heightAnchor, multiplier: 1.0),
        ])
    }
    
    private func setupTitleConstraints() {
        contentView.addSubview(title)
        
        title.setContentHuggingPriority(.required, for: .vertical)
        title.setContentCompressionResistancePriority(.required, for: .vertical)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1.0),
            title.leadingAnchor.constraint(equalToSystemSpacingAfter: illustration.trailingAnchor, multiplier: 2.0),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: title.trailingAnchor, multiplier: 2.0),
        ])
    }
    
    private func setupSubtitleConstraints() {
        contentView.addSubview(subtitle)
        
        subtitle.setContentHuggingPriority(.required, for: .vertical)
        subtitle.setContentCompressionResistancePriority(.required, for: .vertical)
        
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalToSystemSpacingBelow: title.bottomAnchor, multiplier: 0.5),
            subtitle.leadingAnchor.constraint(equalToSystemSpacingAfter: illustration.trailingAnchor, multiplier: 2.0),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: subtitle.trailingAnchor, multiplier: 2.0),
        ])
    }
    
    private func setupPriceConstraints() {
        contentView.addSubview(price)
        
        price.setContentHuggingPriority(.required, for: .vertical)
        price.setContentCompressionResistancePriority(.required, for: .vertical)
        
        NSLayoutConstraint.activate([
            price.leadingAnchor.constraint(equalToSystemSpacingAfter: illustration.trailingAnchor, multiplier: 2.0),
            contentView.trailingAnchor.constraint(
                greaterThanOrEqualToSystemSpacingAfter: price.trailingAnchor,
                                            multiplier: 2.0
            ),
            price.bottomAnchor.constraint(equalTo: illustration.bottomAnchor),
        ])
    }
    
    private func setupConstraints() {
        setupIllustrationConstraints()
        setupTitleConstraints()
        setupSubtitleConstraints()
        setupPriceConstraints()
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
