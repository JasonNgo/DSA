//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-31.
//

import Foundation

public func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root else {
        return root
    }

    let leftInverted = invertTree(root.left)
    let rightInverted = invertTree(root.right)

    root.left = rightInverted
    root.right = leftInverted

    return root
}
