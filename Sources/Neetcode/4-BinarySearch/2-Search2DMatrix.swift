//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-19.
//

import Foundation

/*
 https://leetcode.com/problems/search-a-2d-matrix/description/

 You are given an m x n integer matrix matrix with the following two properties:

 Each row is sorted in non-decreasing order.
 The first integer of each row is greater than the last integer of the previous row.

 Given an integer target, return true if target is in matrix or false otherwise.

 You must write a solution in O(log(m * n)) time complexity.
 */

public func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard !matrix.isEmpty, !matrix[0].isEmpty else { return false }

    var top = 0
    var bottom = matrix.count - 1

    while top <= bottom {
        let mid = top + (bottom - top) / 2

        if let first = matrix[mid].first {
            if target < first {
                bottom = mid - 1
            } else if target > first {
                top = mid + 1
            } else {
                return true
            }
        }
    }

    let candidateRowIndex = bottom
    if candidateRowIndex < 0 || candidateRowIndex >= matrix.count {
        return false
    }

    let row = matrix[candidateRowIndex]
    guard let first = row.first, let last = row.last, (first...last).contains(target) else {
        return false
    }

    var left = 0
    var right = row.count - 1
    while left <= right {
        let mid = left + (right - left) / 2
        if row[mid] < target {
            left = mid + 1
        } else if row[mid] > target {
            right = mid - 1
        } else {
            return true
        }
    }

    return false
}

fileprivate func _searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let rows = matrix.count
    let cols = matrix[0].count

    var start = 0
    var end = (rows * cols) - 1

    while start <= end {
        let middle = start + (end - start) / 2
        let middleValue = matrix[middle / cols][middle % cols]

        if middleValue > target {
            end = middle - 1
        } else if middleValue < target {
            start = middle + 1
        } else {
            return true
        }
    }

    return false
}
