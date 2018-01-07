//
//  AerisWeather.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

struct AerisWeather: Codable {
    let response: [Response]
}

struct Response: Codable {
    let loc: Location
    let periods: [Periods]
}

struct Location: Codable {
    let long: Double
    let lat: Double
}

struct Periods: Codable {
    let validTime: String
    let maxTempC: Int
    let maxTempF: Int
    let minTempC: Int
    let minTempF: Int
    let sunriseISO: String
    let sunsetISO: String
    let icon: String
    let windSpeedMPH: Int
    let precipIN: Double
    let weather: String
}

struct AerisWeatherAPIClient {
    private init() {}
    static let manager = AerisWeatherAPIClient()
    func getWeather(from zipCode: String,
                 completionHandler: @escaping ([Periods]) -> Void,
                 errorHandler: @escaping (Error) -> Void) {
        let id = "inuKos7Cl0FzTqqi45f3D"
        let secret = "ZtTVQ9xwhhBNaOqYM3l2QjCa93J8NBPsUbo6cOQl"
        let urlStr = "https://api.aerisapi.com//forecasts/\(zipCode)?limit=7&client_id=\(id)&client_secret=\(secret)"
        let request = URLRequest(url: URL(string: urlStr)!)
        let parseAerisWeather: (Data) -> Void = {(data: Data) in
            do {
                let weatherInfo = try JSONDecoder().decode(AerisWeather.self, from: data)
                let response = weatherInfo.response
                if let perioids = response.first?.periods {
                    completionHandler(perioids)
                }
            }
            catch {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request,
                                              completionHandler: parseAerisWeather,
                                              errorHandler: errorHandler)
    }
}
