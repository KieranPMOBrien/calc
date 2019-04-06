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

let equation = Equation(userInput)

// print the result of running the solve() function with the userInput String array that contains the list of inputted values from the user.
print("\(equation.solve())")
