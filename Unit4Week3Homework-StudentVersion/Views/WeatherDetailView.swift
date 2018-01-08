//
//  WeatherDetailView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class WeatherDetailView: UIView { //All UI Elements & init for custom view

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    lazy var forecastForLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "RobotoCondensed-Regular", size: UIScreen.main.bounds.height * 0.041)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var currentWeatherStatusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.024, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var highLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    lazy var precipitationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: WeatherView().screenHeight * 0.022, weight: .regular)
        label.textAlignment = .left
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
}

extension WeatherDetailView {
    
    private func commonInit() {
        backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
        setupViews()
    }
    
    private func setupViews() {
        setupBlurEffectView()
        setupForecastForLocationLabel()
        setupLocationImageView()
        setupCurrentWeatherStatusLabel()
        setupDetailLabelsStackView()
    }
    
    public func getPixabayImages(from pixabay: Hits?, aerisWeather: Periods) {
        if let imgUrl = pixabay?.webformatURL {
            ImageAPIClient.manager.loadImage(from: imgUrl,
                                         completionHandler: {self.locationImageView.image = $0},
                                         errorHandler: {print($0)})
        } else {
            locationImageView.image = UIImage(named: aerisWeather.icon)
        }
    }

    public func configureDetailView(weatherInfo: Periods, image: Hits) {
        let formattedDate = DateFormatHelper.formatter.formateDate(from: weatherInfo.validTime,
                                                                   inputDateFormat: "yyyy-MM-dd'T'HH:mm:ssZ",
                                                                   outputDateFormat: "MMM d, yyyy")
        
        let formattedSunsetTime = DateFormatHelper.formatter.formateDate(from: weatherInfo.sunsetISO,
                                                                         inputDateFormat: "yyyy-MM-dd'T'HH:mm:ssZ",
                                                                         outputDateFormat: "MMM d, h:mm a").components(separatedBy: ",").last!
        
        let formattedSunriseTime = DateFormatHelper.formatter.formateDate(from: weatherInfo.sunriseISO,
                                                                          inputDateFormat: "yyyy-MM-dd'T'HH:mm:ssZ",
                                                                          outputDateFormat: "MMM d, h:mm a").components(separatedBy: ",").last!
    
        forecastForLocationLabel.text = "Your forecast for \(formattedDate)"
        currentWeatherStatusLabel.text = weatherInfo.weather
        highLabel.text = "High: \(weatherInfo.maxTempF) F"
        lowLabel.text = "Low: \(weatherInfo.minTempF) F"
        sunriseLabel.text = "Sunrise: \(formattedSunriseTime)"
        sunsetLabel.text = "Sunset: \(formattedSunsetTime)"
        windSpeedLabel.text = "Wind Speed: \(weatherInfo.windSpeedMPH) MPH"
        precipitationLabel.text = "Precipitation: \(weatherInfo.precipIN) Inches"
        getPixabayImages(from: image, aerisWeather: weatherInfo)
    }
}
    
    //Setup constraints for UI elements
extension WeatherDetailView {
    
    private func setupBlurEffectView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.regular) // .light, .dark, .prominent, .regular, .extraLight
        let visualEffect = UIVisualEffectView(frame: UIScreen.main.bounds)
        visualEffect.effect = blurEffect
        addSubview(visualEffect)
    }
    
    private func setupForecastForLocationLabel() {
        addSubview(forecastForLocationLabel)
        forecastForLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        [forecastForLocationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: WeatherView().screenHeight / 44),
         forecastForLocationLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
         forecastForLocationLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)]
            .forEach{$0.isActive = true}
    }
    
    private func setupLocationImageView() {
        addSubview(locationImageView)
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        [locationImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
         locationImageView.topAnchor.constraint(equalTo: forecastForLocationLabel.bottomAnchor, constant: WeatherView().screenHeight / 44),
         locationImageView.widthAnchor.constraint(equalTo: widthAnchor),
         locationImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)]
            .forEach{$0.isActive = true}
    }
    
    private func setupCurrentWeatherStatusLabel() {
        addSubview(currentWeatherStatusLabel)
        currentWeatherStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        [currentWeatherStatusLabel.topAnchor.constraint(equalTo: locationImageView.bottomAnchor, constant: WeatherView().screenHeight / 44),
         currentWeatherStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
         currentWeatherStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor)]
            .forEach{$0.isActive = true}
    }
    
    private func setupDetailLabelsStackView() {
        addSubview(detailLabelsStackView)
        detailLabelsStackView.translatesAutoresizingMaskIntoConstraints = false
        [detailLabelsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
         detailLabelsStackView.topAnchor.constraint(equalTo: currentWeatherStatusLabel.bottomAnchor, constant: WeatherView().screenHeight / 44),
         detailLabelsStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.5)]
            .forEach{$0.isActive = true}
    }
}

