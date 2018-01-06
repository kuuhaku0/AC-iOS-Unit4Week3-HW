//
//  WeatherDetailViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    let weatherDetailView = WeatherDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(WeatherDetailView())
        configureNavBar()
    }
    private func configureNavBar() {
        navigationItem.title = "Forecast"
        
        //Setup UIBarButtonItem
        let saveImageToFavoritesBarItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveImageToFavorites))
        navigationItem.rightBarButtonItem = saveImageToFavoritesBarItem
    }

    @objc func saveImageToFavorites() {
        
    }
    
}
