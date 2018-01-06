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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoritesView)
        favoritesView.tableView.dataSource = self
        favoritesView.tableView.delegate = self
    }
    
}

extension FavoriteImagesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteImagesCell", for: indexPath) as! FavoriteImagesTableViewCell
        cell.configureCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.33
    }
}
