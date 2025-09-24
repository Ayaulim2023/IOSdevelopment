//
//  main.swift
//  Problem9
//
//  Created by Аяулым Куат on 24.09.2025.
//

import Foundation

func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        return nil
    }
    return a / b
}

while true {
    print("\nEnter first number (or type 'exit' to quit): ", terminator: "")
    guard let input1 = readLine(), input1.lowercased() != "exit" else { break }
    guard let num1 = Double(input1) else {
        print("Invalid number. Try again.")
        continue
    }

    print("Enter second number: ", terminator: "")
    guard let input2 = readLine(), let num2 = Double(input2) else {
        print("Invalid number. Try again.")
        continue
    }

    print("Choose operation (+, -, *, /): ", terminator: "")
    guard let operation = readLine() else { continue }

    var result: Double?

    switch operation {
    case "+":
        result = add(num1, num2)
    case "-":
        result = subtract(num1, num2)
    case "*":
        result = multiply(num1, num2)
    case "/":
        result = divide(num1, num2)
        if result == nil {
            print("Error: Division by zero is not allowed.")
            continue
        }
    default:
        print("Invalid operation. Please use +, -, * or /.")
        continue
    }

    print("Result: \(result!)")
}

print("Calculator exited. Goodbye!")
