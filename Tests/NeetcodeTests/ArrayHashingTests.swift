//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-13.
//

import TestingCore
import Neetcode
import Testing

@Suite("Neetcode - ArrayHashing Tests")
public struct ArrayHashingTests {

    @Test
    func groupAnagramsReturnsValidOutput() {
        let input = ["act","pots","tops","cat","stop","hat"]
        let expectedOutput = [["hat"],["act", "cat"],["stop", "pots", "tops"]]
        let actualOutput = groupAnagrams(input)

        #expect(arraysOfArraysEqualUnordered(actualOutput, expectedOutput))
    }

    @Test
    func topKFrequentElementsReturnsValidOutput() async throws {
        let input = [1,2,2,3,3,3]
        let expectedOutput = [2,3]
        let actualOutput = topKFrequentElements(input, 2)

        #expect(arraysEqualUnordered(actualOutput, expectedOutput))
    }

    @Test
    func encodeDecodeStringReturnsValidOutput() {
        let input = ["neet","code","love","you"]

        let encodedString = encodeString(input)
        let decodedString = decodeString(encodedString)

        #expect(decodedString == input)
    }

    @Test
    func testStringsWithSpecialCharacters() {
        let input = ["we", "say", ":", "yes", "1#2", "hello#world", "abc#123"]

        let encodedString = encodeString(input)
        let decodedString = decodeString(encodedString)

        #expect(decodedString == input)
    }

    @Test
    func testProductsOfArraysExceptSelfReturnsValidOutput() {
        let input = [1, 2, 3, 4]

        let expectedOutput = [24, 12, 8, 6]
        let actualOutput = productsOfArrayExceptSelf(input)

        #expect(actualOutput == expectedOutput)
    }

    @Test
    func testIsValidSudokuReturnsValidOutput() {
        let input =
        [["1","2",".",".","3",".",".",".","."],
         ["4",".",".","5",".",".",".",".","."],
         [".","9","8",".",".",".",".",".","3"],
         ["5",".",".",".","6",".",".",".","4"],
         [".",".",".","8",".","3",".",".","5"],
         ["7",".",".",".","2",".",".",".","6"],
         [".",".",".",".",".",".","2",".","."],
         [".",".",".","4","1","9",".",".","8"],
         [".",".",".",".","8",".",".","7","9"]]

        let expectedOutput = true
        let actualOutput = isValidSudoku(input)

        #expect(actualOutput == expectedOutput)
    }

    @Test
    func testIsValidSudokuReturnsValidOutput2() {
        let input =
        [["1","2",".",".","3",".",".",".","."],
         ["4",".",".","5",".",".",".",".","."],
         [".","9","1",".",".",".",".",".","3"],
         ["5",".",".",".","6",".",".",".","4"],
         [".",".",".","8",".","3",".",".","5"],
         ["7",".",".",".","2",".",".",".","6"],
         [".",".",".",".",".",".","2",".","."],
         [".",".",".","4","1","9",".",".","8"],
         [".",".",".",".","8",".",".","7","9"]]

        let expectedOutput = false
        let actualOutput = isValidSudoku(input)

        #expect(actualOutput == expectedOutput)
    }

}
