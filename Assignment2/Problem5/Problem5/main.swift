//
//  main.swift
//  Problem5
//
//  Created by Аяулым Куат on 24.09.2025.
//

import Foundation

print("Enter a sentence: ", terminator: "")
if let input = readLine() {
    let lowercaseSentence = input.lowercased()
    let cleanedSentence = lowercaseSentence.components(separatedBy: CharacterSet.punctuationCharacters).joined()

    let words = cleanedSentence.split(separator: " ").map { String($0) }

    var wordFrequencies: [String: Int] = [:]

    for word in words {
        if let count = wordFrequencies[word] {
            wordFrequencies[word] = count + 1
        } else {
            wordFrequencies[word] = 1
        }
    }

    print("\nWord Frequencies:")
    for (word, count) in wordFrequencies {
        print("\(word): \(count)")
    }
}
