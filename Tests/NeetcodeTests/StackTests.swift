//
//  StackTests.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-14.
//

import TestingCore
import Neetcode
import Testing

@Suite("Neetcode - Stack Tests")
public struct StackTests {

    @Test
    func testMinStackReturnsValidOutput() {
        let minStack = MinStack()
        minStack.push(1)
        minStack.push(2)
        minStack.push(0)
        #expect(minStack.getMin() == 0)
        minStack.pop()
        #expect(minStack.top() == 2)
        #expect(minStack.getMin() == 1)
    }

}
