//
//  main.swift
//  Problem4
//
//  Created by Аяулым Куат on 24.09.2025.
//

import Foundation

var shoppingList: [String] = []

var shouldExit: Bool = false

while !shouldExit {
    print("""
        \n==== Shopping List Manager ====
        1. Add item
        2. Remove item
        3. View shopping list
        4. Exit
        Choose an option:
        """, terminator: " ")
    if let choice = readLine() {
            switch choice {
            case "1":
                print("Enter the item to add: ", terminator: "")
                if let newItem = readLine(), !newItem.isEmpty {
                    shoppingList.append(newItem)
                    print("'\(newItem)' added to the shopping list.")
                } else {
                    print("Invalid input.")
                }

            case "2":
                if shoppingList.isEmpty {
                    print("Your shopping list is empty. Nothing to remove.")
                } else {
                    print("Enter the item to remove: ", terminator: "")
                    if let itemToRemove = readLine() {
                        if let index = shoppingList.firstIndex(of: itemToRemove) {
                            shoppingList.remove(at: index)
                            print("'\(itemToRemove)' removed from the shopping list.")
                        } else {
                            print("Item not found in the list.")
                        }
                    }
                }

            case "3":
                if shoppingList.isEmpty {
                    print("Your shopping list is empty.")
                } else {
                    print("Current Shopping List:")
                    for (index, item) in shoppingList.enumerated() {
                        print("\(index + 1). \(item)")
                    }
                }

            case "4":
                print("Exiting Shopping List Manager. Goodbye!")
                shouldExit = true

            default:
                print("Invalid option. Please enter 1–4.")
            }
        }
}
