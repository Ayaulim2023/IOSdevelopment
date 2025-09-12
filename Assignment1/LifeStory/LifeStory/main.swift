//
//  main.swift
//  LifeStory
//
//  Created by Аяулым Куат on 12.09.2025.
//

import Foundation

//step1
let firstName: String = "Ayaulym"
let lastName: String = "Kuat"
let birthYear: Int = 2006
let isStudent: Bool = true
let height: Double = 1.70
let isSecondChild: Bool =  true
let band: String = "🎶"
let movie: String = "🎞️"

//bonus
let currentYear = 2025
let age = currentYear - birthYear

//step2
let hobby: String = "Crocheting"
let numberOfHobbies: Int = 2
let favoriteNumber: Int = 5
let isHobbyCreative: Bool = true
let favoriteBand: String = "Queen"
let favoriteMovie: String = "Kill Bill"

//step3
var myStory: String = """
    My name is \(firstName) \(lastName). I was born in \(birthYear), so now I am \(age) years old. I am a student: \(isStudent), my height is \(height) meters, and it is \(isSecondChild) that I am the second child in my family. One of my favorite hobbies is \(hobby), and in total I have \(numberOfHobbies) hobbies. My favorite number is \(favoriteNumber), and it is \(isHobbyCreative) that my hobby is creative. I really enjoy listening to \(favoriteBand) and watching \(favoriteMovie).
    """

//step4
//print(myStory)

//bonus
let myFutureGoal: String = "I want to become a succesful UI/UX designer in the future."
myStory += " " + myFutureGoal

print(myStory)
