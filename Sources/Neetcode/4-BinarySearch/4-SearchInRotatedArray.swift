//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-27.
//

import Foundation

/*
 https://leetcode.com/problems/search-in-rotated-sorted-array/description/

 There is an integer array nums sorted in ascending order (with distinct values).

 Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

 Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

 You must write an algorithm with O(log n) runtime complexity.
 */

public func searchInRotatedArray(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1

    while left <= right {
        let middle = left + (right - left) / 2
        if nums[middle] == target {
            return middle
        }

        // Left partition
        if nums[left] <= nums[middle] {
            if target > nums[middle] || target < nums[left] {
                left = middle + 1
            } else {
                right = middle - 1
            }
        } else {
            if target < nums[middle] || nums[right] < target {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
    }

    return -1
}
