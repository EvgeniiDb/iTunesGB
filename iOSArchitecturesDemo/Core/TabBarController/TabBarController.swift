//
//  TabBarController.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 08.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

/// Tab bar контроллер приложения
final class TabBarController: UITabBarController {
    
    //MARK: - Lify cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .black
        self.tabBar.barTintColor = .white
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.backgroundColor = .white
    }
}
