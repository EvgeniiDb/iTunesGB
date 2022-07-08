//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let appSearchRootVC = SearchBuilder.build()
        appSearchRootVC.navigationItem.title = "Search for apps"
        var appImage = UIImage()
        
        if #available(iOS 13.0, *) {
            appImage = UIImage(systemName: "apps.iphone") ?? UIImage()
        }
        
        let appSearchVC = createNavController(for: appSearchRootVC,
                                           title: "Apps",
                                           image: appImage
        )
        
        let songsSearchRootVC = SearchSongsBuilder.build()
        songsSearchRootVC.navigationItem.title = "Search for songs"
        var songsImage = UIImage()
        
        if #available(iOS 13.0, *) {
            songsImage = UIImage(systemName: "music.note") ?? UIImage()
        }
        
        let songsSearchVC = createNavController(for: songsSearchRootVC,
                                                   title: "Songs",
                                                   image: songsImage
        )
        
        
        let tabBarVC = TabBarController()
        tabBarVC.viewControllers = [appSearchVC, songsSearchVC]
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }
    
    
    // Создаём Navigation контроллер по переданным параметрам
    private func createNavController(for rootViewController: UIViewController,
                                     title: String,
                                     image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.navigationBar.barTintColor = UIColor.varna
        navController.navigationBar.isTranslucent = false
        navController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.tintColor = .black
        return navController
    }
}

