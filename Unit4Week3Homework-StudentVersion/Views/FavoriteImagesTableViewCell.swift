//
//  FavoriteImagesTableViewCell.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoriteImagesTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoritesImageView.clipsToBounds = true
    }
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var favoritesImageView: UIImageView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    
//    var imageTopConstraint: NSLayoutConstraint!
//    var imageHeightConstraint: NSLayoutConstraint!
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: "FavoriteImagesCell")
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//    }

//    private func commonInit() {
//        backgroundColor = .white
//        imageTopConstraint.
//        imageHeightConstraint.constant =
//        setupViews()
//    }
//
//    private func setupViews() {
//        setupFavoritesImageView()
//    }
    
//    lazy var favoritesImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.clipsToBounds = true
//        return imageView
//    }()
    
//    func configureCell(withPhoto photo: Favorite) {
//        commonInit()
//        print("Setting image")
//    }
    
//    private func setupFavoritesImageView() {
//        addSubview(favoritesImageView)
//        favoritesImageView.addConstraint(imageTopConstraint)
//        favoritesImageView.addConstraint(imageHeightConstraint)
//        [favoritesImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//         favoritesImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)]
//            .forEach{$0.isActive = true}
//    }
}

