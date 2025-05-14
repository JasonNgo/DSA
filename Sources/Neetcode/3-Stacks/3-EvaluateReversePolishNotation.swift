//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-14.
//

import Foundation

/*
 You are given an array of strings tokens that represents a valid arithmetic expression in Reverse Polish Notation.

 Return the integer that represents the evaluation of the expression.

     The operands may be integers or the results of other operations.
     The operators include '+', '-', '*', and '/'.
     Assume that division between integers always truncates toward zero.

 */

public func evaluateReversePolishNotation(_ tokens: [String]) -> Int {
    let operationTypes = Set(["+", "-", "*", "/"])

    var stack = [String]()
    var total = 0

    for token in tokens {
        switch token {
        case "+":
            let secondNumber = Int(stack.removeLast()) ?? 0
            let firstNumber = Int(stack.removeLast()) ?? 0
            stack.append("\(firstNumber + secondNumber)")
        case "-":
            let secondNumber = Int(stack.removeLast()) ?? 0
            let firstNumber = Int(stack.removeLast()) ?? 0
            stack.append("\(firstNumber - secondNumber)")
        case "*":
            let secondNumber = Int(stack.removeLast()) ?? 0
            let firstNumber = Int(stack.removeLast()) ?? 0
            stack.append("\(firstNumber * secondNumber)")
        case "/":
            let secondNumber = Int(stack.removeLast()) ?? 0
            let firstNumber = Int(stack.removeLast()) ?? 0
            stack.append("\(firstNumber / secondNumber)")
        default:
            stack.append(token)
        }
    }

    return Int(stack.last ?? "0") ?? 0
}
