//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-06-02.
//

import Core
import Foundation

public enum DFSTraversalType {
    case preOrder // root/left/right
    case inOrder // left/root/right
    case postOrder // left/right/root
}

public func dfsTraversal(type: DFSTraversalType, recursive: Bool, _ root: TreeNode?) -> [Int] {
    if recursive {
        return treeRecursiveDFSTraversal(type: type, root)
    } else {
        return treeDFSTraversal(type: type, root)
    }
}

// Recursive
fileprivate func treeDFSTraversal(type: DFSTraversalType, _ root: TreeNode?) -> [Int] {
    guard let root else {
        return []
    }

    var result = [Int]()

    switch type {
    case .preOrder:
        result += [root.val]
        result += treeDFSTraversal(type: type, root.left)
        result += treeDFSTraversal(type: type, root.right)
    case .inOrder:
        result += treeDFSTraversal(type: type, root.left)
        result += [root.val]
        result += treeDFSTraversal(type: type, root.right)
    case .postOrder:
        result += treeDFSTraversal(type: type, root.left)
        result += treeDFSTraversal(type: type, root.right)
        result += [root.val]
    }

    return result
}

fileprivate func treeRecursiveDFSTraversal(type: DFSTraversalType, _ root: TreeNode?) -> [Int] {
    guard let root else {
        return []
    }

    var result = [Int]()

    switch type {
    case .preOrder:
        var stack = [root]
        
        while !stack.isEmpty {
            let poppedValue = stack.removeLast()
            result.append(poppedValue.val)

            if let right = poppedValue.right {
                stack.append(right)
            }
            if let left = poppedValue.left {
                stack.append(left)
            }
        }
    case .inOrder:
        var stack: [TreeNode] = []
        var current: TreeNode? = root

        while current != nil || !stack.isEmpty {
            while let node = current {
                stack.append(node)
                current = node
            }

            let poppedValue = stack.removeLast()
            result.append(poppedValue.val)

            current = current?.right
        }
    case .postOrder:
        var stack: [TreeNode] = []
        var current: TreeNode? = root
        var lastVisited: TreeNode?

        while current != nil || !stack.isEmpty {
            if let node = current {
                stack.append(node)
                current = current?.left
            } else {
                let peekNode = stack.last!

                if let right = peekNode.right, right !== lastVisited {
                    current = right
                } else {
                    result.append(peekNode.val)
                    lastVisited = stack.removeLast()
                }
            }
        }
    }

    return result
}
