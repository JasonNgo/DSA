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

}
