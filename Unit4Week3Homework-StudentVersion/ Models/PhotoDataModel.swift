//
//  PhotoDataModel.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/10/18.
//  Copyright © 2018 C4Q . All rights reserved.
//
import Foundation
import UIKit

class PhotoDataModel {
    
    private init() {}
    static let manager = PhotoDataModel()
    
    static private var pixabayImages = [Hits]()
    
    static func setPixabayImage(image: [Hits]) {
        self.pixabayImages = image
    }
    
    static func getPixabayImage() -> [Hits] {
        return pixabayImages
    }
}
