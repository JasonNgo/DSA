//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-14.
//

import Foundation

/*
 https://leetcode.com/problems/generate-parentheses/description/
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 Example 1:
 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]

 Example 2:
 Input: n = 1
 Output: ["()"]
 */

public func genereateParantheses(_ n: Int) -> [String] {
    var result = [String]()

    func backtrack(current: String, open: Int, close: Int) {
        if current.count == n * 2 {
            result.append(current)
            return
        }

        if open < n {
            backtrack(current: current + "(", open: open + 1, close: close)
        }

        if close < open {
            backtrack(current: current + ")", open: open, close: close + 1)
        }
    }

    backtrack(current: "", open: 0, close: 0)

    return result
}
