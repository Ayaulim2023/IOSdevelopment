//
//  Address.swift
//  ShoppingCartAssignment
//
//  Created by Аяулым Куат on 01.10.2025.
//

import Foundation

struct Address {
    let street: String
    let city: String
    let zipCode: String
    let country: String
    
    
    var formattedAddress: String{
        """
        \(street)
        \(city), \(zipCode)
        \(country)
        """
    }
}
