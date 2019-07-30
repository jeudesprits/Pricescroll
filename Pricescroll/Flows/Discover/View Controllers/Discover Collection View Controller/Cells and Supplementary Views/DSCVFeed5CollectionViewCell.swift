//
//  DSCVFeed5CollectionViewCell.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/28/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import UIKit

final class DSCVFeed5CollectionViewCell: UICollectionViewCell, Identifiable {
    
    private lazy var label: UILabel = {
        $0.text = "TopCharts"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        $0.textColor = .systemBlue
        $0.font = .preferredFont(forTextStyle: .title2)
        return $0
    }(UILabel(frame: .zero))
    
    private lazy var accessoryImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(
                   systemName: effectiveUserInterfaceLayoutDirection == .rightToLeft ? "chevron.left" : "chevron.right",
            withConfiguration: UIImage.SymbolConfiguration(textStyle: .title2, scale: .small)
        )
        $0.tintColor = .systemGray2
        return $0
    }(UIImageView(frame: .zero))
    
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
    
    private func setupLabelConstraints() {
        contentView.addSubview(label)
        
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        let bottom = label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0)
        bottom.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            accessoryImageView.leadingAnchor.constraint(
                greaterThanOrEqualToSystemSpacingAfter: label.trailingAnchor,
                                            multiplier: 1.0
            ),
            bottom,
        ])
    }
    
    private func setupAccessoryImageViewConstraints() {
        contentView.addSubview(accessoryImageView)
        
        NSLayoutConstraint.activate([
            accessoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            accessoryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    private func setupSeparatorViewConstraints() {
        contentView.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1.0 / UIScreen.main.scale)
        ])
    }
    
    private func setupConstraints() {
        setupAccessoryImageViewConstraints()
        setupLabelConstraints()
        setupSeparatorViewConstraints()
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
