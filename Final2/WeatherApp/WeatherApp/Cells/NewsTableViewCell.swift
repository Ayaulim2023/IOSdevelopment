//
//  NewsTableViewCell.swift
//  WeatherApp
//
//  Created by Аяулым Куат on 08.12.2025.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(with article: NewsArticle) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description ?? "No description"
        
        // Format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: article.publishedAt) {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            dateLabel.text = dateFormatter.string(from: date)
        }
        
        // Load image with Kingfisher
        if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
            articleImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        } else {
            articleImageView.image = UIImage(systemName: "photo")
        }
    }
}
