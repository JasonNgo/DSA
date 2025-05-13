//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-13.
//

import Foundation

/*
 Given an integer array nums, return an array output where output[i] is the product of all the elements of nums except nums[i].

 Each product is guaranteed to fit in a 32-bit integer.

 Follow-up: Could you solve it in O(n)O(n) time without using the division operation?
 */

public func productsOfArrayExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var products: [Int] = Array(repeating: 0, count: nums.count)
    var preSum: [Int] = Array(repeating: 0, count: nums.count)
    var postSum: [Int] = Array(repeating: 0, count: nums.count)

    preSum[0] = 1
    postSum[n - 1] = 1

    for i in 1..<n {
        preSum[i] = preSum[i - 1] * nums[i - 1]
    }

    for i in stride(from: n - 2, through: 0, by: -1) {
        postSum[i] = postSum[i + 1] * nums[i + 1]
    }

    for i in 0..<nums.count {
        products[i] = preSum[i] * postSum[i]
    }

    return products
}

fileprivate func _productsOfArrayExceptSelf(_ nums: [Int]) -> [Int] {
    var res = [Int](repeating: 1, count: nums.count)

    var prefix = 1
    for i in 0..<nums.count {
        res[i] = prefix
        prefix *= nums[i]
    }

    var postfix = 1
    for i in stride(from: nums.count - 1, through: 0, by: -1) {
        res[i] *= postfix
        postfix *= nums[i]
    }

    return res
}
