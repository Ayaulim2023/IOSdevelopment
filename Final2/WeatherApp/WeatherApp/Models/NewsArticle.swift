//
//  NewsArticle.swift
//  WeatherApp
//
//  Created by Аяулым Куат on 08.12.2025.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [NewsArticle]
}

struct NewsArticle: Codable {
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let source: Source
    
    struct Source: Codable {
        let name: String
    }
}
