//
//  File: Functions.swift
//  Project: calc
//
//  This file conatins
//
//  Created by Kieran O'Brien on 6/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

func loopOverArrayForOperands(_ array: [String], operands: String) -> [String] {
    
    // Create a copy of the equation array for us to manipulate.
    var equation = array
    
    // Initiate a position value that tracks our current position while we loop.
    var position: Int = 0
    
    // Loop over the equation array.
    for value in equation {
        
        // Check for operands passed into the function.
        if checkForOperands(value, for: operands) {
            
            // Calulate the result of the 2 value operation, and place it into the position before the current operand.
            equation[position + 1] = calculateAnswer(firstValue: equation[position - 1], operatorValue: value, secondValue: equation[position + 1])
            
            // Remove the operand and following value from equation array as the answer to the operation was stored in the value before the operand.
            equation.remove(at: position)
            equation.remove(at: position - 1)
            
            // Go back a position as we have just removed an item from the array.
            position -= 1
        } else {
            
            // There was no operand found,
            position += 1
        }
    }
    return equation
}

// Check if any inputted operands are in the inputted value String.
func checkForOperands(_ equationValue: String, for operands: String) -> Bool {
    
    // loop over every operand in the operands list.
    for operand in operands {
        
        // If the operand currently being looped over matches the operand passed into the function. If it matches, return true.
        if String(operand) == equationValue {
            return true
        }
    }
    
    // There were no matching values. Return false to the calling function.
    return false
}

// Calculate the answer for two values with the provided operator.
func calculateAnswer(firstValue: String, operatorValue: String, secondValue: String) -> String {
    
    // Make sure the numbers from the equation are integer numbers, if not exit the program with code 1.
    guard let valueOne = Int(firstValue) else {
        print("The equation was not valid. Please check it before running agian.")
        exit(1)
    }
    guard let valueTwo = Int(secondValue) else {
        print("The equation was not valid. Please check it before running agian.")
        exit(1)
    }
    
    // Switch over the operator type and perform necessary operation, then return the resulting value as a String. If the operator did not match exit the program with an error message.
    switch operatorValue {
    case "x":
        return String(valueOne * valueTwo)
    case "/":
        // Check to make sure we arent dividing by zero. If so exit the program with nonzero status and produce a meaningful error to the user.
        if (valueTwo == 0) {
            print("You cannot divide by zero. Please check your equation before running agian")
            exit(1)
        }
        return String(valueOne / valueTwo)
    case "%":
        return String(valueOne % valueTwo)
    case "+":
        return String(valueOne + valueTwo)
    case "-":
        return String(valueOne - valueTwo)
    default:
        print("The equation was not valid. Please check it before running agian.")
        exit(1)
    }
}
