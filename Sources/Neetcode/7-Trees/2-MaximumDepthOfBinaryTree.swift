//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-31.
//

import Core
import Foundation

/*
 https://leetcode.com/problems/maximum-depth-of-binary-tree/description/
 */

public func maxDepth(_ root: TreeNode?) -> Int {
    guard let root else {
        return 0
    }

    let leftDepth = maxDepth(root.left)
    let rightDepth = maxDepth(root.right)

    return max(leftDepth, rightDepth) + 1
}
