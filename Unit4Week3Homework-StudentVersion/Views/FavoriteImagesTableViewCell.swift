//
//  FavoriteImagesTableViewCell.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoriteImagesTableViewCell: UITableViewCell {
    
    var imageTopConstraint: NSLayoutConstraint!
    var imageHeightConstraint: NSLayoutConstraint!
    
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
        favoritesImageView.translatesAutoresizingMaskIntoConstraints = false
        imageTopConstraint.isActive = true
        imageHeightConstraint.isActive = true
    }
    
    lazy var favoritesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        return imageView
    }()
    
    func configureCell(withPhoto photo: Favorite) {
        commonInit()
        favoritesImageView.image = photo.image
        print("Setting image")
    }
    
    private func setupFavoritesImageView() {
        addSubview(favoritesImageView)
        imageTopConstraint = favoritesImageView.topAnchor.constraint(equalTo: contentView.topAnchor)
        imageHeightConstraint = favoritesImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        [favoritesImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        favoritesImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)]
            .forEach{$0.isActive = true}
    }
}

