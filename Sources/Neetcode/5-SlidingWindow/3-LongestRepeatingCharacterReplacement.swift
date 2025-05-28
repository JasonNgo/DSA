//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-28.
//

import Foundation

/*
 https://leetcode.com/problems/longest-repeating-character-replacement/description/

 You are given a string s and an integer k. You can choose any character of the string and change it to
 any other uppercase English character. You can perform this operation at most k times.

 Return the length of the longest substring containing the same letter you can get after performing the above operations.
 */

public func characterReplacement(_ s: String, _ k: Int) -> Int {
    guard s.count > 1 else {
        return s.count
    }

    var freqMap = [Character: Int]()
    var left = s.startIndex
    var result = 0

    for right in 0..<s.count {
        // keep track of character counts
        let rightIndex = s.index(s.startIndex, offsetBy: right)
        freqMap[s[rightIndex], default: 0] += 1

        // verify if current window is valid
        let windowCount = s.distance(from: left, to: rightIndex) + 1
        let maxCharacterFreq = freqMap.values.max() ?? 0

        if windowCount - maxCharacterFreq > k {
            freqMap[s[left], default: 0] -= 1
            left = s.index(after: left)
        } else {
            result = max(result, windowCount)
        }
    }

    return result
}
