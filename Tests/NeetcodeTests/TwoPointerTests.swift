//
//  Test.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-08.
//

import Neetcode
import Testing

@Suite("Neetcode - Two Pointer Tests")
public struct TwoPointerTests {

    // MARK: - IsValidPalindrome

    @Test(arguments: [
        "racecar",
        "Was it a car or a cat I saw?",
        "Was it a car or!! a cat I saw?",
        "  W as it a car or!! a cat I saw  ?  "
    ])
    func isValidPalindromeReturnsTrueWithValidInput(_ input: String) async throws {
        let expected = true

        #expect(expected == isValidPalindrome(input))
    }

    @Test(arguments: [
        "tab a cat",
        "mooncake",
        "Mon mon mon"
    ])
    func isValidPalindromeReturnsFalseWithInvalidInput(_ input: String) async throws {
        let expected = false
        #expect(expected == isValidPalindrome(input))
    }

    // MARK: - Two Integer Sum II

    @Test
    func testTwoIntegerSumIIReturnsValidOutput() {
        let array = [1, 2, 3, 4]
        let expected = [1, 2]

        #expect(expected == twoIntegerSumII(array, 3))
    }

    @Test
    func testTwoIntegerSumIIReturnsValidOutput2() {
        let array = [1, 2, 3, 4]
        let expected = [1, 2]

        #expect(expected == twoIntegerSumII(array, 3))
    }

    // MARK: - Three Sum

    @Test
    func testThreeSumReturnsValidOutput() {
        let nums = [-1, 0, 1, 2, -1, -4]
        let expected: Set<Set<Int>> = [ [-1, -1, 2], [-1, 0, 1] ].map { Set($0) }.reduce(into: Set<Set<Int>>()) { $0.insert($1) }
        let result = Set(threeSum(nums).map { Set($0) })

        #expect(result == expected)
    }

    @Test
    func testThreeSumReturnsValidOutput2() {
        let array = [0, 0, 0]
        let expected = [[0, 0, 0]]

        #expect(expected == threeSum(array))
    }

    @Test
    func testThreeSumReturnsValidOutput3() {
        let array = [0, 1, 1]
        let expected: [[Int]] = [[]]

        #expect(expected == threeSum(array))
    }

    @Test
    func testThreeSumReturnsValidOutput4() {
        let nums = [-5, -3, -2, -1, 0, 4, 5]
        let expected = [
            [-5, 0, 5],
            [-3, -2, 5],
            [-3, -1, 4]
        ]

        #expect(threeSum(nums) == expected)
    }

    // MARK: - Container with most water

    @Test
    func testMaximumAreaOfContainerReturnsValidOutput() {
        let heights = [1,8,6,2,5,4,8,3,7]
        let result = maximumAreaOfContainer(heights)
        #expect(result == 49)
    }

    @Test
    func testMaximumAreaOfContainerReturnsValidOutput2() {
        let heights = [1, 1]
        let result = maximumAreaOfContainer(heights)
        #expect(result == 1)
    }

    @Test
    func testMaximumAreaOfContainerReturnsValidOutput3() {
        let heights = [5, 5, 5, 5, 5]
        let result = maximumAreaOfContainer(heights)
        #expect(result == 5 * (5 - 1))
    }

    @Test
    func testMaximumAreaOfContainerReturnsValidOutput4() {
        let heights = [9, 8, 7, 6, 5, 4, 3, 2, 1]
        let result = maximumAreaOfContainer(heights)
        #expect(result == 20)
    }

    @Test
    func testMaximumAreaOfContainerReturnsValidOutput5() {
        let heights = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        let result = maximumAreaOfContainer(heights)
        #expect(result == 20)
    }

    @Test
    func testMaximumAreaOfContainerReturnsValidOutput6() {
        let heights = [0, 0, 0, 10, 0, 0]
        let result = maximumAreaOfContainer(heights)
        #expect(result == 0)
    }

    @Test
    func testMaximumAreaOfContainerReturnsValidOutput7() {
        let heights = [0, 0, 0, 0, 0]
        let result = maximumAreaOfContainer(heights)
        #expect(result == 0)
    }

    @Test
    func testMaximumAreaOfContainerReturnsValidOutput8() {
        let heights = Array(1...10_000)
        let result = maximumAreaOfContainer(heights)
        #expect(result == 9999)
    }

}
