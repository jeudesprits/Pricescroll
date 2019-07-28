//
//  DSCVTitleSupplementaryView.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/23/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import UIKit

final class DSCVTitleSupplementaryView: UICollectionReusableView, Identifiable {
    
    private lazy var title: UILabel = {
        $0.text = "Как у вас дела?"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.adjustsFontForContentSizeCategory = true
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .title1)
        $0.textColor = .label
        return $0
    }(UILabel(frame: .zero))
    
    private func setupTitleConstraints() {
        addSubview(title)
        
        title.setContentHuggingPriority(.required, for: .vertical)
        title.setContentCompressionResistancePriority(.required, for: .vertical)
        
        let bottomAnchor = title.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        bottomAnchor.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 2.0),
            bottomAnchor,
        ])
    }
    
    private func setupConstraints() {
        setupTitleConstraints()
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


// MARK: - Title element kind

extension UICollectionView {
    
    static let elementKindSectionTitle = "UICollectionElementKindSectionTitle"
    
}
