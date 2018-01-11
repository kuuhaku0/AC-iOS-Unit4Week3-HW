//
//  FavoriteImagesViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoriteImagesViewController: UIViewController {
    
    let favoritesView = FavoriteImagesView()
    
    var top: NSLayoutConstraint!
    
    let parallaxOffsetSpeed: CGFloat = 30
    let cellHeight: CGFloat = 250
    var parallaxImageHeight: CGFloat {
        let maxOffset = sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed * favoritesView.tableView.frame.height) - cellHeight / 2
        return maxOffset + self.cellHeight
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        view.addSubview(favoritesView)
        favoritesView.tableView.dataSource = self
        favoritesView.tableView.delegate = self
    }
}

extension FavoriteImagesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(PersistentStoreManager.manager.getFavorites().count)
        return PersistentStoreManager.manager.getFavorites().count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteImagesCell", for: indexPath) as! FavoriteImagesTableViewCell
        let favorite = PersistentStoreManager.manager.getFavorites()[indexPath.row]
        cell.configureCell(withPhoto: favorite)
        cell.favoritesImageView.heightAnchor.constraint(equalToConstant: self.parallaxImageHeight).isActive = true
        cell.favoritesImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)).isActive = true
        return cell
    }
    
    func parallaxOffset(newOffsetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        return (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let tableView = favoritesView.tableView
        let offSetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [FavoriteImagesTableViewCell] {
            cell.favoritesImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: parallaxOffset(newOffsetY: offSetY, cell: cell)).isActive = true
        }
    }
}
