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
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        titleLabel.textColor = .label
        
        descriptionLabel.text = article.description ?? "No description available"
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .secondaryLabel
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: article.publishedAt) {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            let timeAgo = getTimeAgo(from: date)
            dateLabel.text = "🕒 \(timeAgo) • \(article.source.name)"
        }
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        dateLabel.textColor = .tertiaryLabel
        
        // Load image with Kingfisher
        if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
            articleImageView.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "photo.fill"),
                options: [
                    .transition(.fade(0.2)),
                    .cacheOriginalImage
                ]
            )
        } else {
            articleImageView.image = UIImage(systemName: "photo.fill")
            articleImageView.tintColor = .systemGray3
        }
    }

    private func getTimeAgo(from date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.minute, .hour, .day], from: date, to: now)
        
        if let day = components.day, day > 0 {
            return "\(day)d ago"
        } else if let hour = components.hour, hour > 0 {
            return "\(hour)h ago"
        } else if let minute = components.minute, minute > 0 {
            return "\(minute)m ago"
        } else {
            return "Just now"
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        articleImageView.layer.cornerRadius = 8
        articleImageView.clipsToBounds = true
        
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
        layer.masksToBounds = false
        
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds.insetBy(dx: 0, dy: 4),
            cornerRadius: 12
        ).cgPath
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
    }
}
