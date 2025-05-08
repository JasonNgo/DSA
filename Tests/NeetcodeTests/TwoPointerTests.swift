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

    @Test(arguments: [
        "racecar", 
        "Was it a car or a cat I saw?",
        "Was it a car or!! a cat I saw?",
        "  W as it a car or!! a cat I saw  ?  "
    ])
    public func isValidPalindromeReturnsTrueWithValidInput(_ input: String) async throws {
        let expected = true

        #expect(expected == isValidPalindrome(input))
    }

    @Test(arguments: [
        "tab a cat",
        "mooncake",
        "Mon mon mon"
    ])
    public func isValidPalindromeReturnsFalseWithInvalidInput(_ input: String) async throws {
        let expected = false
        #expect(expected == isValidPalindrome(input))
    }

}
