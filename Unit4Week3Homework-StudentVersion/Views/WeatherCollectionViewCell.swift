//
//  WeatherDetailCollectionViewCell.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(white: 0.95, alpha: 0.5)
        setupViews()
    }
    
    private func setupViews() {
        setupLowLabel()
        setupHighLabel()
        setupDateLabel()
        setupWeatherConditionIV()
    }
    
    public func configureCell(aerisWeather data: Periods) {
        commonInit()
    }
    
    //All UI elements

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.026, weight: .regular)
        return label
    }()
    
    lazy var highLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        return label
    }()
    
    lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        return label
    }()
    
    lazy var weatherConditionIV: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
}
    //Setup constraints for UI elements

extension WeatherCollectionViewCell {
    private func setupDateLabel() {
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        [dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
         dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
         dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
         dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor)]
            .forEach{$0.isActive = true}
    }
    
    private func setupWeatherConditionIV() {
        addSubview(weatherConditionIV)
        weatherConditionIV.translatesAutoresizingMaskIntoConstraints = false
        [weatherConditionIV.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
         weatherConditionIV.heightAnchor.constraint(equalTo: weatherConditionIV.widthAnchor),
         weatherConditionIV.centerXAnchor.constraint(equalTo: centerXAnchor),
         weatherConditionIV.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)]
            .forEach{$0.isActive = true}
    }
    
    private func setupHighLabel() {
        addSubview(highLabel)
        highLabel.translatesAutoresizingMaskIntoConstraints = false
        [highLabel.bottomAnchor.constraint(equalTo: lowLabel.topAnchor),
         highLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
         highLabel.trailingAnchor.constraint(equalTo: trailingAnchor)]
            .forEach{$0.isActive = true}
    }
    
    private func setupLowLabel() {
        addSubview(lowLabel)
        lowLabel.translatesAutoresizingMaskIntoConstraints = false
        [lowLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
         lowLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
         lowLabel.trailingAnchor.constraint(equalTo: trailingAnchor)]
            .forEach{$0.isActive = true}
    }
}
