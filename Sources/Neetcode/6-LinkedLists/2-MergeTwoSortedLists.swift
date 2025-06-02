//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-29.
//

import Core
import Foundation

/*
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.
 */

public func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    let dummyHead = ListNode(-1)
    var tail: ListNode? = dummyHead
    var current1: ListNode? = list1
    var current2: ListNode? = list2

    while let current1Val = current1?.val, let current2Val = current2?.val {
        if current1Val < current2Val {
            tail?.next = current1
            current1 = current1?.next
        } else {
            tail?.next = current2
            current2 = current2?.next
        }

        tail = tail?.next
    }

    while let _ = current1?.val {
        tail?.next = current1
        current1 = current1?.next
        tail = tail?.next
    }

    while let _ = current2?.val {
        tail?.next = current2
        current1 = current2?.next
        tail = tail?.next
    }

    return dummyHead.next
}
