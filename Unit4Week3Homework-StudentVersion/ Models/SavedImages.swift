//
//  SavedImages.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/10/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit

struct Favorite: Codable {
    let webformatURL: String
    let cityName: String
    let id: Int

    var image: UIImage? {
        set{}
        get {
            let imageURL = PersistentStoreManager.manager.dataFilePath(withPathName: "\(id)")
            let docImage = UIImage(contentsOfFile: imageURL.path)
            return docImage
        }
    }
}
