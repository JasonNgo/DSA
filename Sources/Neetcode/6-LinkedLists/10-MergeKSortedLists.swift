//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-31.
//

import Core
import HeapModule
import Foundation

/*
 https://leetcode.com/problems/merge-k-sorted-lists/description/

 You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

 Merge all the linked-lists into one sorted linked-list and return it.

 Example 1:
 Input: lists = [[1,4,5],[1,3,4],[2,6]]
 Output: [1,1,2,3,4,4,5,6]
 Explanation: The linked-lists are:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 merging them into one sorted list:
 1->1->2->3->4->4->5->6

 Example 2:
 Input: lists = []
 Output: []

 Example 3:
 Input: lists = [[]]
 Output: []
 */

public func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard !lists.isEmpty else {
        return nil
    }

    guard lists.count > 1 else {
        return lists.first!
    }

    return mergeKListsIterative(lists)
}

// Merge two lists at a time, store intermediate merges, and continue merging until each pair is merged
// Time Complexity: O(kn) where k is the number of lists and n is the total number of nodes
fileprivate func mergeKListsIterative(_ lists: [ListNode?]) -> ListNode? {
    var lists = lists

    for i in 1..<lists.count {
        let firstList = lists[i - 1]
        let secondList = lists[i]
        let mergedList = _merge(firstList, secondList)

        lists[i] = mergedList
    }

    return lists.last!
}

// Merge two lists at a time, but merge them as pairs (1 + 2), (3 + 4), etc. Similar to how merge sort works.
// Time Complexity: O(nlogk)
// Space Complexity: O(1)
fileprivate func mergeKListsIterativeImproved(_ lists: [ListNode?]) -> ListNode? {
    var lists = lists

    while lists.count > 1 {
        var mergedLists = [ListNode?]()

        for i in stride(from: 0, to: lists.count, by: 2) {
            let firstList = lists[i]
            let secondList = i + 1 < lists.count ? lists[i + 1] : nil
            let mergedList = _merge(firstList, secondList)

            mergedLists.append(mergedList)
        }

        lists = mergedLists
    }

    return lists.first!
}

fileprivate func mergeKListsWithHeap(_ lists: [ListNode?]) -> ListNode? {
    struct NodeContainer: Comparable {
        let node: ListNode

        init(node: ListNode) {
            self.node = node
        }

        static func < (lhs: NodeContainer, rhs: NodeContainer) -> Bool {
            return lhs.node.val < rhs.node.val
        }
        
        static func == (lhs: NodeContainer, rhs: NodeContainer) -> Bool {
            return lhs.node.val == rhs.node.val
        }
    }

    let dummyHead = ListNode(-1)
    var tail: ListNode? = dummyHead

    var heap = Heap<NodeContainer>()
    for list in lists where list != nil {
        heap.insert(NodeContainer(node: list!))
    }

    while let min = heap.popMin() {
        tail?.next = min.node
        tail = tail?.next

        if let next = min.node.next {
            heap.insert(NodeContainer(node: next))
        }
    }

    return dummyHead.next
}

fileprivate func _merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummyHead = ListNode(-1)
    var tail: ListNode? = dummyHead

    var curr1 = l1
    var curr2 = l2

    while curr1 != nil || curr2 != nil {
        let curr1Val = curr1?.val ?? Int.max
        let curr2Val = curr2?.val ?? Int.max

        if curr1Val <= curr2Val {
            tail?.next = curr1
            tail = tail?.next
            curr1 = curr1?.next
        } else {
            tail?.next = curr2
            tail = tail?.next
            curr2 = curr2?.next
        }
    }

    return dummyHead.next
}
