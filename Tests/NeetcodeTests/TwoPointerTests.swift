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

}
