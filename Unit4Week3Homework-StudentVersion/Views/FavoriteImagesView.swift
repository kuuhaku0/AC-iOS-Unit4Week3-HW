//
//  FavoriteImagesView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoriteImagesView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .cyan
        setupViews()
    }
    
    private func setupViews() {
        setupTableView()
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(FavoriteImagesTableViewCell.self, forCellReuseIdentifier: "FavoriteImagesCell")
        return tv
    }()
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
         tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)]
            .forEach{ $0.isActive = true }
    }
}

