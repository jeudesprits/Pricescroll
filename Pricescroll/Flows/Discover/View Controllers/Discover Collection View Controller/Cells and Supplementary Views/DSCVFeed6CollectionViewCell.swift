//
//  DSCVFeed6CollectionViewCell.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/30/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import UIKit

final class DSCVFeed6CollectionViewCell: UICollectionViewCell, Identifiable {
    
    private lazy var illustrition: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBlue
        $0.layer.allowsEdgeAntialiasing = true
        $0.layer.cornerRadius = 8.0
        return $0
    }(UIImageView(frame: .zero))
    
    private lazy var title: UILabel = {
        $0.text = "ESPN News and Sports"
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .body)
        $0.textColor = .label
        return $0
    }(UILabel(frame: .zero))
    
    private lazy var subtitle: UILabel = {
        $0.text = "24/7 coverage of the biggest sports stories."
        $0.adjustsFontForContentSizeCategory = true
        $0.numberOfLines = 2
        $0.font = .preferredFont(forTextStyle: .footnote)
        $0.textColor = .secondaryLabel
        return $0
    }(UILabel(frame: .zero))
    
    private lazy var stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.alignment = .fill
        $0.spacing = 5.0
        return $0
    }(UIStackView(frame: .zero))
    
    private lazy var separatorView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .separator
        return $0
    }(UIView(frame: .zero))
       
    var showsSeparator = true {
        didSet {
            separatorView.isHidden = !showsSeparator
        }
    }
    
    private func setupIllustrationConstraints() {
        contentView.addSubview(illustrition)
        
        NSLayoutConstraint.activate([
            illustrition.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1.0),
            illustrition.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: illustrition.bottomAnchor, multiplier: 1.0),
            illustrition.widthAnchor.constraint(equalTo: illustrition.heightAnchor, multiplier: 1.0),
        ])
    }
    
    private func setupStackViewConstraints() {
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        
        title.setContentHuggingPriority(.required, for: .vertical)
        title.setContentCompressionResistancePriority(.required, for: .vertical)
        
        subtitle.setContentHuggingPriority(.required, for: .vertical)
        subtitle.setContentCompressionResistancePriority(.required, for: .vertical)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: illustrition.trailingAnchor, multiplier: 1.0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    private func setupSeparatorViewConstraints() {
        contentView.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(
                equalToSystemSpacingAfter: illustrition.trailingAnchor,
                               multiplier: 1.0
            ),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1.0 / UIScreen.main.scale)
        ])
    }
    
    private func setupConstraints() {
        setupIllustrationConstraints()
        setupStackViewConstraints()
        setupSeparatorViewConstraints()
    }
    
    override static var requiresConstraintBasedLayout: Bool { true }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        showsSeparator = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
