//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-08.
//

import Foundation

/*
 https://neetcode.io/problems/three-integer-sum

 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] where nums[i] + nums[j] + nums[k] == 0, and the indices i, j and k are all distinct.
 The output should not contain any duplicate triplets. You may return the output and the triplets in any order.

 Example 1:
 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].

 Example 2:
 Input: nums = [0,1,1]
 Output: []
 Explanation: The only possible triplet does not sum up to 0.
 */

public func threeSum(_ nums: [Int], target: Int = 0) -> [[Int]] {
    var result = [[Int]]()

    // sort in ascending order
    let sortedNums = nums.sorted(by: { $0 < $1 })

    for (index, candidate) in sortedNums.enumerated() {
        // if current candidate is same as previous skip iteration
        if index > 0 && candidate == sortedNums[index - 1] {
            continue
        }

        var left = index + 1
        var right = sortedNums.count - 1

        while left < right {
            let value = target - candidate
            let total = sortedNums[left] + sortedNums[right]

            if total < value {
                left += 1
            } else if total > value {
                right -= 1
            } else {
                result.append([candidate, sortedNums[left], sortedNums[right]])
                left += 1
                right -= 1

                while left < right && sortedNums[left] == sortedNums[left - 1] { left += 1 }
                while left < right && sortedNums[right] == sortedNums[right + 1] { right -= 1 }
            }
        }
    }

    return result.isEmpty ? [[]] : result
}
