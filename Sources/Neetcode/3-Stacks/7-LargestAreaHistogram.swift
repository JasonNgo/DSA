//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-19.
//

import Foundation

/*
 // https://leetcode.com/problems/largest-rectangle-in-histogram/description/

 84. Largest Rectangle in Histogram

 Given an array of integers heights representing the histogram's bar height where the width of each bar is 1,
 return the area of the largest rectangle in the histogram.
 */

public func largestRectangleArea(_ heights: [Int]) -> Int {
    var maxArea = 0
    var stack: [(index: Int, height: Int)] = []

    for (index, height) in heights.enumerated() {
        var start = index

        while let last = stack.last, last.height > height {
            let (poppedIndex, poppedHeight) = stack.removeLast()
            let poppedArea = poppedHeight * (index - poppedIndex)

            maxArea = max(maxArea, poppedArea)
            start = poppedIndex
        }

        stack.append((start, height))
    }

    for (index, height) in stack {
        maxArea = max(maxArea, height * (heights.count - index))
    }

    return maxArea
}
