//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-31.
//

import Core
import Foundation

/*
 https://leetcode.com/problems/diameter-of-binary-tree/description/
 */

public func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var maxDiameter = 0

    @discardableResult
    func _traverse(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return maxDiameter
        }

        let leftTraverse = _traverse(root.left)
        let rightTraverse = _traverse(root.right)

        maxDiameter = max(maxDiameter, leftTraverse + rightTraverse)

        return max(leftTraverse, rightTraverse) + 1
    }

    _traverse(root)
    return maxDiameter
}
