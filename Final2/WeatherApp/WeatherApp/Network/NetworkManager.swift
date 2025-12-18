//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Аяулым Куат on 08.12.2025.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private let newsAPIKey = "3b66db012c664d87b0a5b8f63c8258aa"
    private let weatherAPIKey = "0a203a98c56e18d7c00df3726ba87453"
    
    private init() {}
    
    func fetchNews(completion: @escaping (Result<[NewsArticle], Error>) -> Void) {
        let categories = ["general", "business", "technology", "entertainment", "sports", "science", "health"]
        let randomCategory = categories.randomElement()!
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=\(randomCategory)&apiKey=\(newsAPIKey)"
        
        print("📡 Fetching US \(randomCategory) news...")
        
        AF.request(urlString).responseDecodable(of: NewsResponse.self) { response in
            print("📥 Response received")
            
            switch response.result {
            case .success(let newsResponse):
                print("✅ Success: \(newsResponse.articles.count) \(randomCategory) articles")
                completion(.success(newsResponse.articles))
                
            case .failure(let error):
                print("❌ Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    func fetchWeather(city: String, unit: String = "metric", completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        // unit can be "metric" (Celsius) or "imperial" (Fahrenheit)
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=\(unit)&appid=\(weatherAPIKey)"
        
        print("🌤️ Fetching weather for: \(city) in \(unit) units")
        
        AF.request(urlString).responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case .success(let weatherResponse):
                print("✅ Weather data received for \(weatherResponse.city.name)")
                completion(.success(weatherResponse))
                
            case .failure(let error):
                print("❌ Weather API Error: \(error)")
                completion(.failure(error))
            }
        }
    }
    
}
