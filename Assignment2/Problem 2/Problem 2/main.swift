//
//  main.swift
//  Problem 2
//
//  Created by Аяулым Куат on 20.09.2025.
//

import Foundation

func isPrime(_ n: Int) -> Bool {
    if n < 2 {
        return false
    }
    for i in 2..<n {
        if n % i == 0 {
            return false
        }
    }
    return true
}
for i in 1...100{
    if(isPrime(i)==true){print(i)}
}
//b
