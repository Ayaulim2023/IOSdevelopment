//
//  main.swift
//  Problem8
//
//  Created by Аяулым Куат on 24.09.2025.
//

import Foundation

func isPalindrome(_ text: String) -> Bool {
    let cleaned = text.lowercased().filter { $0.isLetter || $0.isNumber }
    
    let reversed = String(cleaned.reversed())
    
    return cleaned == reversed
}

print(isPalindrome("madam"))
print(isPalindrome("RaceCar"))
print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("hello"))

