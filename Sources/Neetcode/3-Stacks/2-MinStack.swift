//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-14.
//

import Foundation

// 1, 2, 0

// 1, 2, 0
// 1, 1, 0

public class MinStack {

    private var stack = [Int]()
    private var minStack = [Int]()

    public init() {
        
    }

    public func push(_ val: Int) {
        stack.append(val)

        if let last = minStack.last {
            if val <= last {
                minStack.append(val)
            } else {
                minStack.append(last)
            }
        } else {
            minStack.append(val)
        }
    }

    @discardableResult
    public func pop() -> Int? {
        let value = stack.popLast()
        let _ = minStack.popLast()
        return value
    }

    public func top() -> Int? {
        stack.last
    }

    public func getMin() -> Int? {
        minStack.last
    }

}

