//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Аяулым Куат on 08.12.2025.
//

import Foundation

struct WeatherResponse: Codable {
    let list: [WeatherItem]
    let city: City
    
    struct City: Codable {
        let name: String
    }
}

struct WeatherItem: Codable {
    let dt: Int
    let main: MainWeather
    let weather: [Weather]
    let dt_txt: String
    
    struct MainWeather: Codable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
    }
    
    struct Weather: Codable {
        let main: String
        let description: String
        let icon: String
    }
}

