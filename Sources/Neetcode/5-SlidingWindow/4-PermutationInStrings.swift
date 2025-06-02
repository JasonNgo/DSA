//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-28.
//

import Foundation

/*
 https://leetcode.com/problems/permutation-in-string/description/

 Given two strings s1 and s2, return true if s2 contains a of s1, or false otherwise.
 In other words, return true if one of s1's permutations is the substring of s2.

 Example 1:
 Input: s1 = "ab", s2 = "eidbaooo"
 Output: true
 Explanation: s2 contains one permutation of s1 ("ba").

 Example 2:
 Input: s1 = "ab", s2 = "eidboaoo"
 Output: false

 Constraints:
     1 <= s1.length, s2.length <= 104
     s1 and s2 consist of lowercase English letters.
 */

public func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    guard s1.count <= s2.count else {
        return false
    }

    var string1Freq: [Character: Int] = [:]
    for c in s1 {
        string1Freq[c, default: 0] += 1
    }

    var windowFreq: [Character: Int] = [:]

    for right in 0..<s2.count {
        let rightIndex = s2.index(s2.startIndex, offsetBy: right)
        let character = s2[rightIndex]
        windowFreq[character, default: 0] += 1

        if right >= s1.count {
            let leftIndex = s2.index(s2.startIndex, offsetBy: right - s1.count)
            let leftChar = s2[leftIndex]
            windowFreq[leftChar, default: 0] -= 1

            if windowFreq[leftChar] == 0 {
                windowFreq.removeValue(forKey: leftChar)
            }
        }

        if string1Freq == windowFreq {
            return true
        }
    }

    return false
}
