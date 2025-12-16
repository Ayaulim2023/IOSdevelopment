//
//  AppTheme.swift
//  WeatherApp
//
//  Created by Аяулым Куат on 11.12.2025.
//

import UIKit

struct AppTheme {
    // Colors
    static let primary = UIColor.systemBlue
    static let secondary = UIColor.systemTeal
    static let accent = UIColor.systemOrange
    static let background = UIColor.systemGroupedBackground
    static let cardBackground = UIColor.secondarySystemBackground
    
    // Fonts
    static func titleFont(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func bodyFont(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    // Shadows
    static func addCardShadow(to layer: CALayer) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
        layer.masksToBounds = false
    }
}
