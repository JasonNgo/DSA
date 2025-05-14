//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-14.
//

import Foundation

/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.
 */

public func isValidParantheses(_ str: String) -> Bool {
    var stack = [Character]()

    for c in str {
        switch c {
        case "(", "{", "[":
            stack.append(c)
        case ")":
            if stack.last == "(" {
                stack.removeLast()
            } else {
                return false
            }
        case "}":
            if stack.last == "{" {
                stack.removeLast()
            } else {
                return false
            }
        case "]":
            if stack.last == "[" {
                stack.removeLast()
            } else {
                return false
            }
        default:
            break
        }
    }

    return stack.isEmpty
}
