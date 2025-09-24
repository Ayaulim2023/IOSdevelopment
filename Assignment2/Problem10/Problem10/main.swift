//
//  main.swift
//  Problem10
//
//  Created by Аяулым Куат on 24.09.2025.
//

import Foundation

import Foundation

func hasUniqueCharacters(_ text: String) -> Bool {
    var seenCharacters = Set<Character>()
    
    for char in text {
        if seenCharacters.contains(char) {
            return false
        }
        seenCharacters.insert(char)
    }
    
    return true
}

print(hasUniqueCharacters("Hello"))
print(hasUniqueCharacters("World"))
print(hasUniqueCharacters("Swift"))
print(hasUniqueCharacters("Aa"))
print(hasUniqueCharacters("abcABC"))
print(hasUniqueCharacters("moon"))    

