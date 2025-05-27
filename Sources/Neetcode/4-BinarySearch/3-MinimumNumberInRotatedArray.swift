//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-27.
//

import Foundation

/*
 https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/

 Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:

     [4,5,6,7,0,1,2] if it was rotated 4 times.
     [0,1,2,4,5,6,7] if it was rotated 7 times.

 Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].

 Given the sorted rotated array nums of unique elements, return the minimum element of this array.

 You must write an algorithm that runs in O(log n) time.
 */

public func findMinInRotatedArray(_ nums: [Int]) -> Int {
    var result = nums.first ?? 0

    var left = 0
    var right = nums.count - 1

    while left <= right {
        // we're already looking at a sorted array, grab left most value for smallest
        if nums[left] < nums[right] {
            result = min(result, nums[left])
            break
        }

        let middleIndex = left + (right - left) / 2
        let middleValue = nums[middleIndex]

        result = min(result, middleValue)

        if middleValue >= nums[left] {
            left = middleIndex + 1
        } else {
            right = middleIndex - 1
        }
    }

    return result
}
