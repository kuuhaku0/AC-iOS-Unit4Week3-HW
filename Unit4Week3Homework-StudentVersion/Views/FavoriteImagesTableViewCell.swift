//
//  FavoriteImagesTableViewCell.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoriteImagesTableViewCell: UITableViewCell {
    
    let parallaxOffsetSpeed: CGFloat = 30
    let cellHeight: CGFloat = 250
    var parallaxImageHeight: CGFloat {
        let maxOffset = sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed * FavoriteImagesView().tableView.frame.height) - cellHeight / 2
        return maxOffset + self.cellHeight
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoritesImageView.clipsToBounds = true

    }
        
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FavoriteImagesCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "sunny"))
        setupViews()
    }
    
    private func setupViews() {
        setupFavoritesImageView()
    }
    
    lazy var favoritesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func configureCell(withPhoto photo: Favorite) {
        commonInit()
        favoritesImageView.image = photo.image
        print("Setting image")
    }
    
    func parallaxOffset(newOffsetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        return (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
    
    private func setupFavoritesImageView() {
        addSubview(favoritesImageView)
        favoritesImageView.translatesAutoresizingMaskIntoConstraints = false
        [favoritesImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
         favoritesImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
        favoritesImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        favoritesImageView.trailingAnchor.constraint(equalTo: trailingAnchor)]
            .forEach{$0.isActive = true}
    }
}

