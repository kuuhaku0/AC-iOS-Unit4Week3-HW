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
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupLowLabel()
        setupHighLabel()
        setupDateLabel()
        setupWeatherConditionIV()
    }
    
    //All UI elements
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.text = "Date"
        return label
    }()
    
    lazy var highLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.text = "High"
        return label
    }()
    
    lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.text = "Low"
        return label
    }()
    
    lazy var weatherConditionIV: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.image = #imageLiteral(resourceName: "sunny")
        return imageView
    }()
    
    //Setup constraints for UI elements
    
    private func setupDateLabel() {
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        [dateLabel.topAnchor.constraint(equalTo: topAnchor),
         dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
         dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
         dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor)]
            .forEach{$0.isActive = true}
    }
    
    private func setupWeatherConditionIV() {
        addSubview(weatherConditionIV)
        weatherConditionIV.translatesAutoresizingMaskIntoConstraints = false
        [weatherConditionIV.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
         weatherConditionIV.bottomAnchor.constraint(equalTo: highLabel.topAnchor),
         weatherConditionIV.centerXAnchor.constraint(equalTo: centerXAnchor),
         weatherConditionIV.widthAnchor.constraint(equalTo: widthAnchor)]
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
        [lowLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
         lowLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
         lowLabel.trailingAnchor.constraint(equalTo: trailingAnchor)]
            .forEach{$0.isActive = true}
    }
    
}
