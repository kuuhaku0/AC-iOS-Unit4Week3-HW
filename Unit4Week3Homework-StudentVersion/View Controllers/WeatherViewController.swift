//
//  ViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q  on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let weatherView = WeatherView()
    var cityNameFromZipCode: String! {
        didSet {
            weatherView.weatherForCityLabel.text = "7 Day Forecast for \(cityNameFromZipCode ?? "")"
        }
    }
    var aerisWeather = [Periods]() {
        didSet {
            weatherView.weatherCollectionView.reloadData()
        }
    }
    
    let cellSpacing: CGFloat = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(weatherView)
        weatherView.weatherCollectionView.delegate = self
        weatherView.weatherCollectionView.dataSource = self
        weatherView.zipCodeTextField.delegate = self
        navigationItem.title = "Weather"
        checkSavedZipcode()
    }
    
    private func checkSavedZipcode() {
        if let zipCode = UserDefaults.standard.object(forKey: "Saved Zip Code") {
            weatherView.zipCodeTextField.text = zipCode as? String
            AerisWeatherAPIClient.manager.getWeather(from: zipCode as! String,
                                                     completionHandler: {self.aerisWeather = $0},
                                                     errorHandler: {print($0)})
            ZipCodeHelper.manager.getLocationName(from: zipCode as! String,
                                                  completionHandler: {self.cityNameFromZipCode = $0},
                                                  errorHandler: {print($0)})
        }
    }
}

extension WeatherViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard !(textField.text?.isEmpty)! else {
            let alert = UIAlertController(title: "Error", message: "Field cannot be empty", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            return false
        }
        if let zipCode = textField.text {
            aerisWeather = []
            cityNameFromZipCode = ""
            AerisWeatherAPIClient.manager.getWeather(from: zipCode,
                                                     completionHandler: {self.aerisWeather = $0},
                                                     errorHandler: {print($0)})
            ZipCodeHelper.manager.getLocationName(from: zipCode,
                                                  completionHandler: {self.cityNameFromZipCode = $0},
                                                  errorHandler: {print($0)})
            UserDefaults.standard.set(zipCode, forKey: "Saved Zip Code")
            textField.resignFirstResponder()
            textField.text = ""
            return true
        }
        textField.text = ""
        return true
    }
}

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return aerisWeather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCollectionViewCell
        let weatherForDate = aerisWeather[indexPath.row]
        let formattedDate = DateFormatHelper.formatter.formateDate(from: weatherForDate.validTime,
                                                                   inputDateFormat: "yyyy-MM-dd'T'HH:mm:ssZ",
                                                                   outputDateFormat: "MMM d, yyyy")
        cell.dateLabel.text = formattedDate
        cell.highLabel.text = "High: \(weatherForDate.maxTempF)"
        cell.lowLabel.text = "Low: \(weatherForDate.minTempF)"
        cell.weatherConditionIV.image = UIImage(named: weatherForDate.icon)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weatherInfo = aerisWeather[indexPath.row]
        let detailVC = WeatherDetailViewController(weather: weatherInfo)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCells: CGFloat = 3
        let numSpaces: CGFloat = numCells + 1
        
        let screenWidth = UIScreen.main.bounds.width
        
        return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: collectionView.bounds.height - 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}

