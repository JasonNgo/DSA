//
//  1-ContainsDuplicates.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-13.
//

import Foundation

/*
 Given an integer array nums, return true if any value appears more than once in the array, otherwise return false.

 Brute Force Algo:
 - Compare every element, to every other element to find duplicates

 Time Complexity: O(n^2) - For each element, compare to n-1 elements
 Space Complexity: O(1) - No additional mem

 Set Algo:
 - A set by definition is a collection of unique elements
 - Create a set and compare the count to the input array
 */

public func containsDuplicates(_ nums: [Int]) -> Bool {
    Set(nums).count == nums.count
}
