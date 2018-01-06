//
//  WeatherDetailView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class WeatherDetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
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
        setupForecastForLocationLabel()
        setupLocationImageView()
        setupCurrentWeatherStatusLabel()
        setupDetailLabelsStackView()

    }
    
    //All UI Elements
    
    lazy var forecastForLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.033, weight: .regular)
        label.textAlignment = .center
        label.text = "Weather Forecast"
        return label
    }()
    
    lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.image = #imageLiteral(resourceName: "sunny")
        return imageView
    }()
    
    lazy var currentWeatherStatusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.033, weight: .regular)
        label.textAlignment = .center
        label.text = "Current Condition"
        return label
    }()
    
    lazy var highLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.textAlignment = .left
        label.text = "High:"
        return label
    }()
    
    lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.textAlignment = .left
        label.text = "Low:"
        return label
    }()
    
    lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.textAlignment = .left
        label.text = "Sunrise:"
        return label
    }()
    
    lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.textAlignment = .left
        label.text = "Sunset:"
        return label
    }()
    
    lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.textAlignment = .left
        label.text = "Wind Speed:"
        return label
    }()
    
    lazy var precipitationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.textAlignment = .left
        label.text = "Precipitation:"
        return label
    }()
    
    lazy var detailLabelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [highLabel,
                                                       lowLabel,
                                                       sunriseLabel,
                                                       sunsetLabel,
                                                       windSpeedLabel,
                                                       precipitationLabel])
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.spacing = 4
        return stackView
    }()
    
    
    //Setup constraints for UI elements
    
    func setupForecastForLocationLabel() {
        addSubview(forecastForLocationLabel)
        forecastForLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        [forecastForLocationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: WeatherView().screenHeight / 44),
         forecastForLocationLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
         forecastForLocationLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)]
            .forEach{$0.isActive = true}
    }
    
    func setupLocationImageView() {
        addSubview(locationImageView)
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        [locationImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
         locationImageView.topAnchor.constraint(equalTo: forecastForLocationLabel.bottomAnchor, constant: WeatherView().screenHeight / 44),
         locationImageView.widthAnchor.constraint(equalTo: widthAnchor),
         locationImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)]
            .forEach{$0.isActive = true}
    }
    
    func setupCurrentWeatherStatusLabel() {
        addSubview(currentWeatherStatusLabel)
        currentWeatherStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        [currentWeatherStatusLabel.topAnchor.constraint(equalTo: locationImageView.bottomAnchor, constant: WeatherView().screenHeight / 44),
         currentWeatherStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
         currentWeatherStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor)]
            .forEach{$0.isActive = true}
    }
    
    func setupDetailLabelsStackView() {
        addSubview(detailLabelsStackView)
        detailLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        [detailLabelsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
         detailLabelsStackView.topAnchor.constraint(equalTo: currentWeatherStatusLabel.bottomAnchor, constant: WeatherView().screenHeight / 44),
         detailLabelsStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.36)]
            .forEach{$0.isActive = true}
    }
    
}
