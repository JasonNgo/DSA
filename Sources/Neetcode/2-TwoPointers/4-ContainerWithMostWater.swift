//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-12.
//

import Foundation

/*
 You are given an integer array heights where heights[i] represents the height of the ithith bar.
 You may choose any two bars to form a container. Return the maximum amount of water a container can store.
 */

/*
 Two pointer algo:
 Time Complexity: O(n)
 Space Complexity: O(1)

 area = min(height[i], height[j]) * (j - i)

 - Position two pointers at ends of array
 - Calculate the area given the current conditions
 - Keep track of the maximum area
 - After calculating the area, you need to move a pointer
 - Move the pointer with the smaller height
 - Think
   - We're trying to maximize height, since moving inwards decreases our width
   - By moving the smaller of the two pointers, we have a chance to improve the area
 */

public func maximumAreaOfContainer(_ heights: [Int]) -> Int {
    var maxArea = 0

    var left = 0
    var right = heights.count - 1

    while left < right {
        let area = min(heights[left], heights[right]) * (right - left)

        if area > maxArea {
            maxArea = area
        }

        if heights[left] < heights[right] {
            left += 1
        } else {
            right -= 1
        }
    }

    return maxArea
}
