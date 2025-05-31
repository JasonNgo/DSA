//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-30.
//

import Foundation

/*
 https://leetcode.com/problems/lru-cache/description/

 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.

 The functions get and put must each run in O(1) average time complexity.
 */

public class LRUCache {

    // MARK: - Definitions

    public class DoubleNode {
        public var key: Int
        public var val: Int
        public var next: DoubleNode?
        public var prev: DoubleNode?

        public init(key: Int, val: Int, next: DoubleNode? = nil, prev: DoubleNode? = nil) {
            self.key = key
            self.val = val
            self.next = next
            self.prev = prev
        }
    }

    // MARK: - Properties

    private var capacity: Int
    private var cache: [Int: DoubleNode]
    private var left: DoubleNode
    private var right: DoubleNode

    // MARK: - Initializers

    public init(_ capacity: Int) {
        self.capacity = capacity
        self.cache = [:]

        self.left = DoubleNode(key: -1, val: -1)
        self.right = DoubleNode(key: -1, val: -1)

        self.left.next = self.right
        self.right.prev = self.left
    }

    // MARK: - Cache Functions

    public func get(_ key: Int) -> Int {
        if let node = cache[key] {
            remove(node)
            insert(node)
            return node.val
        }

        return -1
    }

    public func put(_ key: Int, _ value: Int) {
        if var node = cache[key] {
            var updatedNode = node
            updatedNode.val = value
            cache[key] = updatedNode
            remove(updatedNode)
            insert(updatedNode)
        } else {
            let node = DoubleNode(key: key, val: value)
            cache[key] = node

            insert(node)
        }

        if cache.count > capacity {
            if let lru = left.next {
                remove(lru)
                cache[lru.key] = nil
            }
        }
    }

    // MARK: - Helpers

    private func remove(_ node: DoubleNode?) {
        let prev = node?.prev
        let next = node?.next

        prev?.next = next
        next?.prev = prev
    }

    private func insert(_ node: DoubleNode?) {
        let prev: DoubleNode? = right.prev
        let next: DoubleNode? = right

        prev?.next = node
        next?.prev = node

        node?.prev = prev
        node?.next = next
    }

}
