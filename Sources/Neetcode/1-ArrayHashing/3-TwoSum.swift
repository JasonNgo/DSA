//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-13.
//

import Foundation

/*
 Given an array of integers nums and an integer target, return the indices i and j such that nums[i] + nums[j] == target and i != j.

 You may assume that every input has exactly one pair of indices i and j that satisfy the condition.

 Return the answer with the smaller index first.
 */

public func twoSum(_ nums: [Int], target: Int) -> [Int] {
    var map: [Int: Int] = [:]

    for (index, num) in nums.enumerated() {
        if let value = map[target - num] {
            return [value, index]
        } else {
            map[num] = index
        }
    }

    return [-1, -1]
}
