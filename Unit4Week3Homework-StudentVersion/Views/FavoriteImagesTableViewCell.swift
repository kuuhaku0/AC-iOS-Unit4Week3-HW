//
//  FavoriteImagesTableViewCell.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoriteImagesTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FavoriteImagesCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupFavoritesImageView()
    }
    
    lazy var favoritesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private func setupFavoritesImageView() {
        addSubview(favoritesImageView)
        favoritesImageView.translatesAutoresizingMaskIntoConstraints = false
        [favoritesImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
         favoritesImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
         favoritesImageView.widthAnchor.constraint(equalTo: favoritesImageView.heightAnchor),
         favoritesImageView.heightAnchor.constraint(equalTo: heightAnchor)]
            .forEach{$0.isActive = true}
    }
    
    public func configureCell() {
        commonInit()
        favoritesImageView.image = #imageLiteral(resourceName: "sunny")
    }
    
}
