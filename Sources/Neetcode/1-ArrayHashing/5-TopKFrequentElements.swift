//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-13.
//

import Foundation

/*
 Given an integer array nums and an integer k, return the k most frequent elements within the array.
 The test cases are generated such that the answer is always unique.
 You may return the output in any order.
 */

public func topKFrequentElements(_ nums: [Int], _ k: Int) -> [Int] {
    guard nums.count > k else {
        return []
    }

    var result = [Int]()
    var buckets: [[Int]] = Array(repeating: [], count: nums.count + 1)

    var freqDict: [Int: Int] = [:]
    for num in nums {
        freqDict[num, default: 0] += 1
    }

    for (key, value) in freqDict {
        buckets[value].append(key)
    }

    for i in stride(from: buckets.count - 1, to: 0, by: -1) {
        let values = buckets[i]

        for value in values {
            result.append(value)

            if result.count == k {
                return result
            }
        }
    }

    return result
}
