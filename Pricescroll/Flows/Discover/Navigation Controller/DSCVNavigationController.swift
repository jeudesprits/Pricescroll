//
//  DSCVNavigationController.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/21/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import UIKit

final class DSCVNavigationController: UINavigationController {
    
    // MARK: - Initializers
       
    convenience init() {
        self.init(rootViewController: DSCVCollectionViewController(collectionViewLayout: UICollectionViewLayout()))
        
        tabBarItem = UITabBarItem(title: "Обзор", image: UIImage(systemName: "safari.fill"), selectedImage: UIImage(systemName: "safari.fill"))
        
        navigationBar.prefersLargeTitles = true
        
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithTransparentBackground()
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
    }
}
