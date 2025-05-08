//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-08.
//

import Foundation

/*
 https://neetcode.io/problems/is-palindrome
 
 Given a string s, return true if it is a palindrome, otherwise return false.

 A palindrome is a string that reads the same forward and backward. It is also case-insensitive and ignores all non-alphanumeric characters.

 Example 1:
 Input: s = "Was it a car or a cat I saw?"
 Output: true

 Example 2:
 Input: s = "tab a cat"
 Output: false
 */


/// Validates if the input string is a valid palindrome. By definition
/// A palindrome is a string that reads the same forward and backward.
/// It is also case-insensitive and ignores all non-alphanumeric characters.
/// - Parameter string: The input string to be validated
/// - Returns: True if the input string is a valid palindrome
public func isValidPalindrome(_ string: String) -> Bool {
    let prunedString = string
        .lowercased()
        .unicodeScalars
        .filter { CharacterSet.alphanumerics.contains($0) }

    var left = prunedString.startIndex
    var right = prunedString.index(before: prunedString.endIndex)

    while left < right {
        if prunedString[left] != prunedString[right] {
            return false
        }

        left = prunedString.index(after: left)
        right = prunedString.index(before: right)
    }

    return true
}
