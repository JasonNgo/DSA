//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-13.
//

import Foundation

/*
 Given two strings s and t, return true if the two strings are anagrams of each other, otherwise return false.

 An anagram is a string that contains the exact same characters as another string, but the order of the characters can be different.

 Brute Force:
 - Sort both strings
 - Compare if both strings are the same

 Time Complexity: O(nlog(n))
 Space Complexity: O(1) - O(n) // if including space for sorting

 Count Algo:
 - Iterate through one input string, keeping count of the occurrences of characters
 - Iterate through other string, decrementing counts of characters

 Time Complexity: O(n)
 Space Complexity: O(1) - We can use a static array to keep track of character counts since it's only eng characters
 */

public func validAnagram(_ s: String, _ t: String) -> Bool {
    var counts: [Character: Int] = Dictionary(minimumCapacity: 26)

    for c in s {
        counts[c, default: 0] += 1
    }

    for c in t {
        guard let count = counts[c], count > 0 else {
            return false
        }

        counts[c] = count - 1
    }

    return true
}
