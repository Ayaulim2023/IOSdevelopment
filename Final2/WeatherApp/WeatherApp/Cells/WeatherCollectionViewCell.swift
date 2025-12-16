//
//  WeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Аяулым Куат on 08.12.2025.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = .systemGray4
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
        layer.masksToBounds = false
        
        dateLabel.textColor = .label
        temperatureLabel.textColor = .label
        descriptionLabel.textColor = .secondaryLabel
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let gradientLayer = contentView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = contentView.bounds
        }
    }

    func configure(with weather: WeatherItem) {
        let date = Date(timeIntervalSince1970: TimeInterval(weather.dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        
        dateLabel.text = "📅 \(dateFormatter.string(from: date))\n\(timeFormatter.string(from: date))"
        dateLabel.numberOfLines = 2
        dateLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        
        // Temperature with degree symbol
        let temp = Int(weather.main.temp)
        temperatureLabel.text = "\(temp)°"
        temperatureLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        
        // Description
        descriptionLabel.text = weather.weather.first?.description.capitalized
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        // Weather icon
        if let iconCode = weather.weather.first?.icon {
            let urlString = "https://openweathermap.org/img/wn/\(iconCode)@2x.png"
            if let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) { data, _, _ in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.iconImageView.image = image
                        }
                    }
                }.resume()
            }
        }
        
    }

}
