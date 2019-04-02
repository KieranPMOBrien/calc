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

// Function that solves and returns an integer for an input String array
func solve(_ equation: [String]) -> Int? {
    
    // Create a copy of the equation array for us to manipulate
    var equationCopy = equation
    
    // Defind what our operands are. Note that the order of the operands in this string is critical as it loops over it from left to right
    let operators = "x/%+-"
    
    // For each of the operands in the oeprators string declared above, perform the loopOverForOperator function that takes in the equation array and the current operator we are looking on, and returns the equation array solved for the current operator
    for individualOperator in operators {
        equationCopy = loopOverForOperator(equationCopy, operatorValue: String(individualOperator))
    }
    
    // Now all operations have been performed the array should be only 1 value long if successful
    if equationCopy.count == 1 {
        
        // If the array is only 1 long, meaning the maths was successful, return it to the variable that called the function
        return Int(equationCopy[0])!
    } else {
        
        // The array is not 1 long, therefore there has been an unexpected error. Print a warning message and an extraction of the equation array for error reporting. Then return nul to the variable that called the function
        print("Something went wrong!  Here is an extract of the array:")
        dump(equationCopy)
        return nil
    }
}

// Loop over the whole equation for each operator and search for matches, then do the appropriate maths
func loopOverForOperator(_ equation: [String], operatorValue: String) -> [String] {
    // Create a copy of the equation array for us to manipulate
    var equationCopy = equation
    
    // Create a variable that contains the current integer value of the position we are in the loop
    var position: Int = 0
    
    // Loop over each string (value or operand) in the array
    for value in equationCopy {
        
        // If the value matches the operand we are currently looping, do the following:
        if value == operatorValue {
            // Debug: Print that we have found the operand and its position in the array
            print("Found \(operatorValue) at position \(position)")
            
            // Debug: Print the equation we are going to solve (e.g. 4 x 5)
            print("\(equationCopy[position - 1]) \(operatorValue) \(equationCopy[position + 1])")
            
            // Call the equation solver fuction that takes the two values and the operand type and sets the returned result as the second value
            equationCopy[position + 1] = calculateAnswer(firstValue: equationCopy[position - 1], operatorValue: operatorValue, secondValue: equationCopy[position + 1])!
            
            // Remove the first value and operand from array now we don't need them
            equationCopy.remove(at: position)
            equationCopy.remove(at: position - 1)
        } else {
            // No operand was found, therefore the value we are looked at was a number. Move onto the next value in the array
            position += 1
        }
    }
    
    // Return the manipulated copy of the array that no longer contains any of the current operand
    return equationCopy
}

// Calculate the answer for two values with the provided operator
func calculateAnswer(firstValue: String, operatorValue: String, secondValue: String) -> String? {
    
    // Switch over the operator type and perform and return the resulting value
    switch operatorValue {
    case "x":
        return String(Int(firstValue)! * Int(secondValue)!)
    case "/":
        return String(Int(firstValue)! / Int(secondValue)!)
    case "%":
        return String(Int(firstValue)! % Int(secondValue)!)
    case "+":
        return String(Int(firstValue)! + Int(secondValue)!)
    case "-":
        return String(Int(firstValue)! - Int(secondValue)!)
    default:
        return nil
    }
}

// Debug: Print the equation and solution to the command line
print("Equation: \(userInput.joined(separator: " "))")
print("Solution: \(solve(userInput)!)")

// Debugging: Print the values of the array
//dump(userInput)
