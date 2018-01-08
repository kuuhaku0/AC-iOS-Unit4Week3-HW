//
//  WeatherView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class WeatherView: UIView {
    
    public let screenHeight = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
        setupViews()
    }
    
    private func setupViews() {
        setupWeatherForCityLabel()
        setupWeatherCollectionView()
        setupTextField()
    }
    
    //All UI elements
    
    lazy var weatherForCityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "RobotoCondensed-Regular", size: screenHeight * 0.041)
//            UIFont(ofSize: screenHeight * 0.036, weight: .heavy)
        label.text = "Weather"
        return label
    }()
    
    lazy var weatherCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "WeatherCell")
        return cv
    }()
    
    lazy var zipCodeTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.placeholder = "Enter Zip Code"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: screenHeight * 0.024, weight: .regular)
        textField.backgroundColor = UIColor(white: 1, alpha: 0.8)
        return textField
    }()
    
    //Setup constraints for UI elements
    
    private func setupWeatherForCityLabel() {
        addSubview(weatherForCityLabel)
        weatherForCityLabel.translatesAutoresizingMaskIntoConstraints = false
        [weatherForCityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:
            screenHeight / 44),
         weatherForCityLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
         weatherForCityLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)]
            .forEach{$0.isActive = true}
    }
    
    private func setupWeatherCollectionView() {
        addSubview(weatherCollectionView)
        weatherCollectionView.translatesAutoresizingMaskIntoConstraints = false
        [weatherCollectionView.topAnchor.constraint(equalTo: weatherForCityLabel.bottomAnchor, constant: screenHeight / 44),
         weatherCollectionView.heightAnchor.constraint(equalToConstant: screenHeight * 0.33),
         weatherCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
         weatherCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)]
            .forEach{ $0.isActive = true }
    }
    
    private func setupTextField() {
        addSubview(zipCodeTextField)
        zipCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        [zipCodeTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
         zipCodeTextField.topAnchor.constraint(equalTo: weatherCollectionView.bottomAnchor, constant: screenHeight / 44),
         zipCodeTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.40)]
            .forEach{$0.isActive = true}
    }
}
