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
    
    func configure(with weather: WeatherItem) {
        // Format date
        let date = Date(timeIntervalSince1970: TimeInterval(weather.dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, HH:mm"
        dateLabel.text = dateFormatter.string(from: date)
        
        // Temperature
        temperatureLabel.text = "\(Int(weather.main.temp))°C"
        
        // Description
        descriptionLabel.text = weather.weather.first?.description.capitalized
        
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
