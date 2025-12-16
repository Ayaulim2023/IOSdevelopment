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
    
//    func configure(with weather: WeatherItem) {
//        // Format date
//        let date = Date(timeIntervalSince1970: TimeInterval(weather.dt))
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM dd, HH:mm"
//        dateLabel.text = dateFormatter.string(from: date)
//        
//        // Temperature
//        temperatureLabel.text = "\(Int(weather.main.temp))°C"
//        
//        // Description
//        descriptionLabel.text = weather.weather.first?.description.capitalized
//        
//        // Weather icon
//        if let iconCode = weather.weather.first?.icon {
//            let urlString = "https://openweathermap.org/img/wn/\(iconCode)@2x.png"
//            if let url = URL(string: urlString) {
//                URLSession.shared.dataTask(with: url) { data, _, _ in
//                    if let data = data, let image = UIImage(data: data) {
//                        DispatchQueue.main.async {
//                            self.iconImageView.image = image
//                        }
//                    }
//                }.resume()
//            }
//        }
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Simple light gray background
        contentView.backgroundColor = .systemGray4
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        
        // Shadow
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
        layer.masksToBounds = false
        
        // Text colors for visibility on light gray
        dateLabel.textColor = .label
        temperatureLabel.textColor = .label
        descriptionLabel.textColor = .secondaryLabel
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        // Card style
//        contentView.layer.cornerRadius = 16
//        contentView.layer.masksToBounds = true
//        
//        // Gradient background
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [
//            UIColor.systemBlue.withAlphaComponent(0.8).cgColor,
//            UIColor.systemTeal.withAlphaComponent(0.6).cgColor
//        ]
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
//        gradientLayer.frame = bounds
//        gradientLayer.cornerRadius = 16
//        contentView.layer.insertSublayer(gradientLayer, at: 0)
//        
//        // Shadow
//        layer.cornerRadius = 16
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 4)
//        layer.shadowOpacity = 0.15
//        layer.shadowRadius = 8
//        layer.masksToBounds = false
//        
//        // White text for visibility
//        dateLabel.textColor = .white
//        temperatureLabel.textColor = .white
//        descriptionLabel.textColor = .white.withAlphaComponent(0.9)
//    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Update gradient frame
        if let gradientLayer = contentView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = contentView.bounds
        }
    }

    func configure(with weather: WeatherItem) {
        // Date with emoji
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
        
        // Dynamic gradient based on weather
//        updateGradientForWeather(weather.weather.first?.main ?? "Clear")
    }

//    private func updateGradientForWeather(_ condition: String) {
//        guard let gradientLayer = contentView.layer.sublayers?.first as? CAGradientLayer else { return }
//        
//        let colors: [CGColor]
//        switch condition {
//        case "Clear":
//            colors = [UIColor.systemYellow.cgColor, UIColor.systemOrange.cgColor]
//        case "Clouds":
//            colors = [UIColor.systemGray.cgColor, UIColor.systemGray2.cgColor]
//        case "Rain", "Drizzle":
//            colors = [UIColor.systemBlue.cgColor, UIColor.systemIndigo.cgColor]
//        case "Snow":
//            colors = [UIColor.white.cgColor, UIColor.systemGray5.cgColor]
//        default:
//            colors = [UIColor.systemTeal.cgColor, UIColor.systemBlue.cgColor]
//        }
//        
//        gradientLayer.colors = colors
//    }
}
