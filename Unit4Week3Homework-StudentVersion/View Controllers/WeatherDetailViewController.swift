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
    
    var cityName: String!
    
    private var weatherForDate: Periods!
    
    private var pbImage: Hits!
    
    var randImg: UIImage!
    
    init(weather: Periods, pixabayImageUrl: Hits, cityName: String) {
        super.init(nibName: nil, bundle: nil)
        self.weatherForDate = weather
        self.pbImage = pixabayImageUrl
        self.cityName = cityName
        weatherDetailView.configureDetailView(weatherInfo: weather, imageUrl: pixabayImageUrl, cityName: cityName)
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
        ImageAPIClient.manager.loadImage(from: pbImage.webformatURL,
                                         completionHandler: {self.randImg = $0},
                                         errorHandler: {print($0)})
    }
    
    private func configureNavBar() {
        navigationItem.title = "Forecast"
        let saveImageToFavoritesBarItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveImageToFavorites))
        navigationItem.rightBarButtonItem = saveImageToFavoritesBarItem
    }

    @objc func saveImageToFavorites() {
        guard let image = randImg else {
            return
        }
        PersistentStoreManager.manager.addToFavorites(favorites: pbImage, cityName: cityName, andImage: image)
        let alert = UIAlertController(title: "Saved", message: "Saved Image to Favorites", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
