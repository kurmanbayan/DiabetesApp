//
//  MainTabBarController.swift
//  project1
//
//  Created by Kurnmanbay Ayan on 4/14/18.
//  Copyright © 2018 Kurmanbay Ayan. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        self.tabBar.barTintColor = UIColor.white
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 56
        tabFrame.origin.y = self.view.frame.size.height - 56
        self.tabBar.frame = tabFrame
    }
}
