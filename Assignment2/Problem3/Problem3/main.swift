//
//  main.swift
//  Problem3
//
//  Created by Аяулым Куат on 24.09.2025.
//

import Foundation

func celsiusToFahrenheit(_ c: Double) -> Double {
    return (c * 9/5) + 32
}

func celsiusToKelvin(_ c: Double) -> Double {
    return c + 273.15
}

func fahrenheitToCelsius(_ f: Double) -> Double {
    return (f - 32) * 5/9
}

func fahrenheitToKelvin(_ f: Double) -> Double {
    return (f - 32) * 5/9 + 273.15
}

func kelvinToCelsius(_ k: Double) -> Double {
    return k - 273.15
}

func kelvinToFahrenheit(_ k: Double) -> Double {
    return (k - 273.15) * 9/5 + 32
}

print("Enter a temperature value: ", terminator: "")
if let input = readLine(), let temperature = Double(input) {
    
    print("Enter the unit (C for Celsius, F for Fahrenheit, K for Kelvin): ", terminator: "")
    if let unit = readLine() {
        
        switch unit.uppercased() {
        case "C":
            print("\(temperature)°C is:")
            print("\(celsiusToFahrenheit(temperature))°F")
            print("\(celsiusToKelvin(temperature))K")
            
        case "F":
            print("\(temperature)°F is:")
            print("\(fahrenheitToCelsius(temperature))°C")
            print("\(fahrenheitToKelvin(temperature))K")
            
        case "K":
            print("\(temperature)K is:")
            print("\(kelvinToCelsius(temperature))°C")
            print("\(kelvinToFahrenheit(temperature))°F")
            
        default:
            print("Invalid unit. Please enter C, F, or K.")
        }
        
    } else {
        print("Could not read the unit.")
    }
    
} else {
    print("Invalid temperature input.")
}

