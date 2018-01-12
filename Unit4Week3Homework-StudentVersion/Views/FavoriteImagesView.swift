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
//        setupSelfConstraints()
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.estimatedRowHeight = 250
        tv.rowHeight = UITableViewAutomaticDimension
        tv.register(FavoriteImagesTableViewCell.self, forCellReuseIdentifier: "FavoriteImagesCell")
        return tv
    }()
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
//    func setupSelfConstraints() {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        [self.topAnchor.constraint(equalTo: super.topAnchor),
//         self.bottomAnchor.constraint(equalTo: super.bottomAnchor),
//         self.widthAnchor.constraint(equalTo: super.widthAnchor)]
//            .forEach{$0.isActive = true}
//    }
}

