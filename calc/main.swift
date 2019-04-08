//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

// Collect the users command line input
var userInput = ProcessInfo.processInfo.arguments

// Remoev the first value of the array as it contains directory string of program
userInput.removeFirst()

// Create a new instance of the Equation class with the user input passed in as the equation.
let equation = Equation(userInput)

// Print the result of running the solve() function from the equation instance of the Equation class.
print("\(equation.solve())")
