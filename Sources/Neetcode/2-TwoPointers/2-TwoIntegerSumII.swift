//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-08.
//

import Foundation

/*
 https://neetcode.io/problems/two-integer-sum-ii

 Given an array of integers numbers that is sorted in non-decreasing order.

 Return the indices (1-indexed) of two numbers, [index1, index2], such that they add up to a given
 target number target and index1 < index2. Note that index1 and index2 cannot be equal, therefore
 you may not use the same element twice.

 There will always be exactly one valid solution.

 Your solution must use O(1) additional space.

 Example 1:
 Input: numbers = [1,2,3,4], target = 3
 Output: [1,2]

 Explanation:
 The sum of 1 and 2 is 3. Since we are assuming a 1-indexed array, index1 = 1, index2 = 2. We return [1, 2].
 */

public func twoIntegerSumII(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = numbers.count - 1

    while left < right {
        let sum = numbers[left] + numbers[right]

        if sum < target {
            left += 1
        } else if sum > target {
            right -= 1
        } else {
            return [left + 1, right + 1]
        }
    }

    return [-1, -1]
}
