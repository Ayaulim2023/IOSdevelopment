//
//  ShoppingCartAssignmentTests.swift
//  ShoppingCartAssignmentTests
//
//  Created by Аяулым Куат on 01.10.2025.
//

import Testing
@testable import ShoppingCartAssignment

struct ShoppingCartAssignmentTests {

    @Test func example() async throws {
        let laptop = Product(id: "p1", name: "Laptop", price: 1200, category: .electronics, description: "Gaming Laptop")!
        let book = Product(id: "p2", name: "Swift Book", price: 30, category: .books, description: "Learn Swift")!
        let headphones = Product(id: "p3", name: "Headphones", price: 100, category: .electronics, description: "Noise Cancelling")!

        let cart = ShoppingCart()
        cart.addItem(product: laptop, quantity: 1)
        cart.addItem(product: book, quantity: 2)

        cart.addItem(product: laptop, quantity: 1)
        print("Laptop quantity should be 2, itemCount: \(cart.itemCount)")

        print("Subtotal: \(cart.subtotal)")
        print("Item count: \(cart.itemCount)")

        cart.discountCode = "SAVE10"
        print("Total with discount: \(cart.total)")

        cart.removeItem(productId: book.id)
        print("After removing book, itemCount: \(cart.itemCount)")

        func modifyCart(_ cart: ShoppingCart) {
            cart.addItem(product: headphones, quantity: 1)
        }
        modifyCart(cart)
        print("Cart contains headphones? \(cart.items.contains { $0.product.id == headphones.id })")

        var item1 = CartItem(product: laptop, quantity: 1)
        var item2 = item1
        item2.updateQuantity(5)
        print("Item1 qty: \(item1.quantity), Item2 qty: \(item2.quantity)")

        let address = Address(street: "Main St 123", city: "Almaty", zipCode: "050000", country: "Kazakhstan")
        let order = Order(from: cart, shippingAddress: address)

        cart.clearCart()
        print("Order itemCount: \(order.itemCount)") // не должен быть 0
        print("Cart itemCount: \(cart.itemCount)")   // должен быть 0

    }

}
