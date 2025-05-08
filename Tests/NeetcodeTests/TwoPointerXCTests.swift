//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-08.
//

import Neetcode
import XCTest

final class TwoPointerXCTests: XCTestCase {

    func testIsValidPalindromeReturnsTrueWithValidInput() {
        let arguments = [
            "racecar",
            "Was it a car or a cat I saw?",
            "Was it a car or!! a cat I saw?",
            "  W as it a car or!! a cat I saw  ?  "
        ]

        for string in arguments {
            XCTAssertEqual(true, isValidPalindrome(string))
        }
    }

    func testIsValidPalindromeReturnsFalseWithInvalidInput() {
        let arguments = [
            "tab a cat",
            "mooncake",
            "Mon mon mon"
        ]

        for string in arguments {
            XCTAssertEqual(false, isValidPalindrome(string))
        }
    }

    // MARK: - Two Integer Sum II

    func testTwoIntegerSumIIReturnsValidOutput() {
        let array = [1, 2, 3, 4]
        let expected = [1, 2]

        XCTAssertEqual(expected, twoIntegerSumII(array, 3))
    }

    func testTwoIntegerSumIIReturnsValidOutput2() {
        let array = [1, 2, 3, 4]
        let expected = [1, 2]

        XCTAssertEqual(expected, twoIntegerSumII(array, 3))
    }

}
