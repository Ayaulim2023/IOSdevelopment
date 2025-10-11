//
//  Product.swift
//  ShoppingCartAssignment
//
//  Created by Аяулым Куат on 01.10.2025.
//

import Foundation

struct Product {
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    
    enum Category {
        case electronics, clothing, food, books
    }
    
    var displayPrice: String {
        String(format: "$%.2f", price)
    }
    
    init?(id: String, name: String, price: Double, category: Category, description: String) {
        guard price > 0 else {
            print("Invalid price for \(name)")
            return nil
        }
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}
