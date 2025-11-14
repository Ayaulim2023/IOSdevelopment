//
//  FavoriteCell.swift
//  MyFavorites
//
//  Created by Аяулым Куат on 14.11.2025.
//

import UIKit

class FavoriteCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!

    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review
        itemImageView.image = UIImage(systemName: item.imageName)
        itemImageView.contentMode = .scaleAspectFit
    }
}
