//
//  TabBarViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let weatherVCTab1 = WeatherViewController()
        let favoritesImagesVCTab2 = UIStoryboard(name: "tableView", bundle: nil).instantiateViewController(withIdentifier: "tableView")
            //FavoriteImagesViewController()
        let navVC = UINavigationController(rootViewController: weatherVCTab1)
        let tabBarList = [navVC, favoritesImagesVCTab2]
        navVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        favoritesImagesVCTab2.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        viewControllers = tabBarList
    }
    
}
