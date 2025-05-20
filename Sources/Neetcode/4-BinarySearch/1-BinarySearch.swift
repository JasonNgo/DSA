//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-19.
//

import Foundation

/*
 https://leetcode.com/problems/binary-search/description/

 Given an array of integers nums which is sorted in ascending order, and an integer target,
 write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

 You must write an algorithm with O(log n) runtime complexity.
 */

public func binarySearch(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1

    while left <= right {
        let middle = (left + right) / 2

        if nums[middle] > target {
            right = middle - 1
        } else if nums[middle] < target {
            left = middle + 1
        } else {
            return middle
        }
    }

    return -1
}
