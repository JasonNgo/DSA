//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-12.
//

import Foundation

/*
 https://leetcode.com/problems/trapping-rain-water/description/

 Given n non-negative integers representing an elevation map where the width of each bar is 1,
 compute how much water it can trap after raining.

 Example 1:

 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1].
 In this case, 6 units of rain water (blue section) are being trapped.

 Example 2:
 Input: height = [4,2,0,3,2,5]
 Output: 9
 */

/*
 Key Insights:
 - Water accumulates between two larger bars with shorter bars in between
 - Water at any index depends on the tallest bar to the left and right

 water[i] = min(maxLeft, maxRight) - height[i] if > 0
 */

/*
 Brute Force Algo:
 Time Complexity: O(n^2)
 Space Complexity: O(1)

 for each index:
    scan left to compute maxLeft
    scan right to compute maxRight
    compute water[i]
    add to total
 */

/*
 Prefix/Suffix Max Algo
 Time Complexity: O(n)
 Space Complexity: O(n)

 compute maxLeft array for each index where maxLeft[i] is the maximum value for 0...i indexes
 compute maxRight array for each index where maxRight[i] is the maximum value for i...heights.count - 1

 for each index:
   compute water[i]
     water[i] = max(min(maxLeft[i], maxRight[i]) - height[i], 0) // pos nums only
 */

/*
 Two Pointer algo
 Time Complexity: O(n)
 Space Complexity: O(1)

 position left and right pointers at start/end of array respectfully
 keep a running check of the maxLeft and maxRight values

 while left < right:
    Compute water[i]



 */


public func trappingRainWater(_ heights: [Int]) -> Int {
    var result = 0

    var left = 0
    var right = heights.count - 1
    var maxLeft = heights[left]
    var maxRight = heights[right]

    while left < right {
        if maxLeft < maxRight {
            left += 1
            maxLeft = max(maxLeft, heights[left])
            result += maxLeft - heights[left]
        } else {
            right -= 1
            maxRight = max(maxRight, heights[right])
            result += maxRight - heights[right]
        }
    }

    return result
}
