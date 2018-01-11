//
//  Pixabay.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/7/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

struct Pixabay: Codable {
    let hits: [Hits]
}

struct Hits: Codable {
    let id: Int
    let webformatURL: String
}

struct PixabayAPIClient {
    private init() {}
    static let manager = PixabayAPIClient()
    func getPixabayData(from cityName: String,
                        completionHandler: @escaping ([Hits]) -> Void,
                        errorHandler: @escaping (Error) -> Void) {
        let apiKey = "7289995-9e56b8a2ea40563c0f18dde1f"
        let urlStr = "https://pixabay.com/api/?key=\(apiKey)&safesearch=true&q=\(cityName)"
        let request = URLRequest(url: URL(string: urlStr)!)
        let parsePixabay: (Data) -> Void = {(data: Data) in
            do {
                let pixabayInfo = try JSONDecoder().decode(Pixabay.self, from: data)
                let results = pixabayInfo.hits
                completionHandler(results)
            }
            catch {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: request,
                                              completionHandler: parsePixabay,
                                              errorHandler: errorHandler)
    }
}
