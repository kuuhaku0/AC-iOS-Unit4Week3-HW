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
    
    private var weatherForDate: Periods!
    
    init(weather: Periods) {
        super.init(nibName: nil, bundle: nil)
        self.weatherForDate = weather
        weatherDetailView.configureDetailView(weatherInfo: weather)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) is not supported)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(weatherDetailView)
        configureNavBar()
    }
    
    private func configureNavBar() {
        navigationItem.title = "Forecast"
        let saveImageToFavoritesBarItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveImageToFavorites))
        navigationItem.rightBarButtonItem = saveImageToFavoritesBarItem
    }

    @objc func saveImageToFavorites() {
        
    }
    
}
