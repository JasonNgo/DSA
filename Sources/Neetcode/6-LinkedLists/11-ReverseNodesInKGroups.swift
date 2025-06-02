//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-31.
//

import Core
import Foundation

/*
 https://leetcode.com/problems/reverse-nodes-in-k-group/description/

 Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.

 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.

 You may not alter the values in the list's nodes, only nodes themselves may be changed.
 */

public func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard k > 1 || head != nil else {
        return head
    }

    let dummyHead = ListNode(-1, head)
    var groupPrev: ListNode? = dummyHead

    while true {
        // check if there exists enough nodes to make a group of size k
        var kth: ListNode? = groupPrev
        for _ in 0..<k {
            kth = kth?.next
            if kth == nil { return dummyHead.next }
        }

        // reverse the group
        let groupNext = kth?.next
        var curr = groupPrev?.next
        var prev = groupNext
        while curr !== groupNext {
            let tmp = curr?.next
            curr?.next = prev
            prev = curr
            curr = tmp
        }

        // fix the bindings after
        let groupTmp = groupPrev?.next
        groupPrev?.next = kth
        groupPrev = groupTmp
    }

    return dummyHead.next
}
