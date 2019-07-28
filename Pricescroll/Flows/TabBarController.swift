//
//  TabBarController.swift
//  Pricescroll
//
//  Created by Ruslan Lutfullin on 7/21/19.
//  Copyright © 2019 Ruslan Lutfullin. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: - Initializers
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        setViewControllers([DSCVNavigationController()], animated: false)
    }
    
}
