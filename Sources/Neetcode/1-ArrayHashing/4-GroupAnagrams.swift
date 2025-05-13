//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-13.
//

import Foundation

/*
 Given an array of strings strs, group all anagrams together into sublists. You may return the output in any order.

 An anagram is a string that contains the exact same characters as another string, but the order of the characters can be different.
 */

public func groupAnagrams(_ strings: [String]) -> [[String]] {
    var groups: [[Character: Int]: [String]] = [:]

    for string in strings {
        let characterMap = convertStringToCharacterMap(string)
        groups[characterMap, default: []].append(string)
    }

    return groups.compactMap(\.value)
}

fileprivate func convertStringToCharacterMap(_ string: String) -> [Character: Int] {
    var result = [Character: Int]()

    for c in string {
        result[c, default: 0] += 1
    }

    return result
}
