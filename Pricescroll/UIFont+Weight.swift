//
//  UIFont+Weight.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/29/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func preferredFont(forTextStyle textStyle: TextStyle, weight: Weight) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: textStyle)
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle)
        let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
        return metrics.scaledFont(for: font)
    }
    
}
