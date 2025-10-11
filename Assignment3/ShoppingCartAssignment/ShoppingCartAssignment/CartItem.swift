//
//  CartItem.swift
//  ShoppingCartAssignment
//
//  Created by Аяулым Куат on 01.10.2025.
//

import Foundation

struct CartItem {
    let product: Product
    private(set) var quantity: Int
    
    var subtotal: Double {
        product.price * Double(quantity)
    }
    
    mutating func updateQuantity(_ newQuantity: Int){
        guard newQuantity > 0 else {
            print("Invalid quantity")
            return
        }
        
        quantity = newQuantity
    }
    
    mutating func increasingQuantity(by amount: Int){
        guard amount > 0 else { return }
        quantity += amount
    }
    
}
