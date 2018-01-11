//
//  FavoriteImagesViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoriteImagesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
//    let favoritesView = FavoriteImagesView()
    
//    let refreshControl = UIRefreshControl()
    
    let parallaxOffsetSpeed: CGFloat = 40
    let cellHeight: CGFloat = 250
    var parallaxImageHeight: CGFloat {
        let maxOffset = sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed) - cellHeight / 1.3
        return maxOffset + self.cellHeight
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.tableView.delegate = self
        self.tableView.dataSource = self
 //       view.addSubview(favoritesView)
//        favoritesView.tableView.dataSource = self
//        favoritesView.tableView.delegate = self
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
//        cell.configureCell(withPhoto: favorite)
        cell.favoritesImageView.image = favorite.image
        cell.imageHeightConstraint.constant = self.parallaxImageHeight
        cell.imageTopConstraint.constant =  parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
        cell.widthConstraint.constant = UIScreen.main.bounds.width
        return cell
    }
    
    func parallaxOffset(newOffsetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        return (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let tableView = favoritesView.tableView
        let offSetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [FavoriteImagesTableViewCell] {
            cell.imageTopConstraint.constant = parallaxOffset(newOffsetY: offSetY, cell: cell)
        }
    }
}
