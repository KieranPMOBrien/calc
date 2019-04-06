//
//  Equation.swift
//  calc
//
//  Created by Kieran O'Brien on 6/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

class Equation {
    var equation: [String]
    
    init(_ equation: [String]) {
        self.equation = equation
    }
    
    func solve() -> Int {
        
        // Loop over the array for operands %, /, and x.
        equation = loopOverArrayForOperands(equation, operands: "%/x")
        
        //Loop over the array for operands + and -.
        equation = loopOverArrayForOperands(equation, operands: "+-")
        
        // All operations have been performed. The array should be only 1 value long if successful.
        if equation.count == 1 {
            
            // If the array is only 1 long, meaning the maths was successful, return the remaining variable to the function that called the function.
            return Int(equation[0])!
        } else {
            
            // The array is not 1 long, therefore there has been an error with the inputted equation. Exit the program with a nonzero state.
            print("The equation was not valid. Please check it before running agian.")
            exit(2)
        }
    }
}
