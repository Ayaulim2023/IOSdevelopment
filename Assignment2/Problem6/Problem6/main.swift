//
//  main.swift
//  Problem6
//
//  Created by Аяулым Куат on 24.09.2025.
//

import Foundation

func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 {
        return []
    }
    
    if n == 1 {
        return [0]
    } else if n == 2 {
        return [0, 1]
    }
    
    var sequence = [0, 1]
    
    for i in 2..<n {
        let next = sequence[i - 1] + sequence[i - 2]
        sequence.append(next)
    }
    
    return sequence
}

print(fibonacci(0))
print(fibonacci(1))
print(fibonacci(2))
print(fibonacci(7))  

