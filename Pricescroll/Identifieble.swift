//
//  Identifieble.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/23/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import Foundation

protocol Identifiable: AnyObject {

  static var reuseIdentifier: String { get }
    
}


// MARK: - Default impl.

extension Identifiable {

  static var reuseIdentifier: String {
    let bundleName = Bundle.main.bundleIdentifier!
    return "\(bundleName).\(String(describing: Self.self))"
  }
    
}
