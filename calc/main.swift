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
func solve(_ userInput: [String]) -> Int {
    
    // Create a copy of the equation array for us to manipulate
    var equation = userInput
    
    var position: Int = 0
    for value in equation {
        // check for operands %/x
        if checkForOperands(value, for: "%/x") {

            equation[position + 1] = calculateAnswer(firstValue: equation[position - 1], operatorValue: value, secondValue: equation[position + 1])!
            
            // Remove values from string
            equation.remove(at: position)
            equation.remove(at: position - 1)
            position -= 1
            
            //dump(equationCopy)
        } else {
            position += 1
        }
    }
    
    // Reset the position back to 0 to being new loop
    position = 0
    
    for value in equation {
        // check for operands +-
        if checkForOperands(value, for: "+-") {
            
            equation[position + 1] = calculateAnswer(firstValue: equation[position - 1], operatorValue: value, secondValue: equation[position + 1])!
            
            // Remove values from string
            equation.remove(at: position)
            equation.remove(at: position - 1)
            position -= 1
            
            //dump(equationCopy)
        } else {
            position += 1
        }
    }
    
    // Now all operations have been performed the array should be only 1 value long if successful
    if equation.count == 1 {
        
        // If the array is only 1 long, meaning the maths was successful, return it to the variable that called the function
        return Int(equation[0])!
    } else {
        
        // The array is not 1 long, therefore there has been an unexpected error. Print a warning message and an extraction of the equation array for error reporting. Then return nul to the variable that called the function
        //print("Something went wrong!  Here is an extract of the array:")
        //dump(equationCopy)
        exit(1)
    }
}

func checkForOperands(_ value: String, for operands: String) -> Bool {
    for operand in operands {
        if String(operand) == value {
            return true
        }
    }
    return false
}

// Calculate the answer for two values with the provided operator
func calculateAnswer(firstValue: String, operatorValue: String, secondValue: String) -> String? {
    
    // Make sure the values are numbers and the input is not incorrect
    guard let valueOne = Int(firstValue) else { exit(1) }
    guard let valueTwo = Int(secondValue) else { exit(1) }

    
    // Switch over the operator type and perform and return the resulting value
    switch operatorValue {
    case "x":
        return String(valueOne * valueTwo)
    case "/":
        return String(valueOne / valueTwo)
    case "%":
        return String(valueOne % valueTwo)
    case "+":
        return String(valueOne + valueTwo)
    case "-":
        return String(valueOne - valueTwo)
    default:
        return nil
    }
}

print("\(solve(userInput))")
