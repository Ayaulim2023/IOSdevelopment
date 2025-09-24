//
//  main.swift
//  Problem7
//
//  Created by Аяулым Куат on 24.09.2025.
//

import Foundation

var students: [String: Int] = [
    "Alice": 85,
    "Bob": 72,
    "Charlie": 90,
    "Diana": 65,
    "Ethan": 78
]

let scores = Array(students.values)

let total = scores.reduce(0, +)
let average = Double(total) / Double(scores.count)

if let maxScore = scores.max(), let minScore = scores.min() {
    print("Grade Report")
    print("----------------------")
    print("Average score: \(String(format: "%.2f", average))")
    print("Highest score: \(maxScore)")
    print("Lowest score: \(minScore)")
    print("----------------------\n")
    
    for (name, score) in students {
        if Double(score) >= average {
            print("\(name): \(score) Above or equal to average")
        } else {
            print("\(name): \(score) Below average")
        }
    }
}
