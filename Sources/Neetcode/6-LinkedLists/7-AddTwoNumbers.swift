//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-30.
//

import Foundation

/*
 https://leetcode.com/problems/add-two-numbers/description/

 You are given two non-empty linked lists representing two non-negative integers.
 The digits are stored in reverse order, and each of their nodes contains a single digit.
 Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Example 1:
 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.

 Example 2:
 Input: l1 = [0], l2 = [0]
 Output: [0]

 Example 3:
 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
 */

public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    // edge case: if one of the lists is empty return the non-empty list
    guard let l1 else {
        return l2
    }

    // edge case: if one of the lists is empty return the non-empty list
    guard let l2 else {
        return l1
    }

    // use a dummy head to make adding to the list straightforward
    var dummyHead = ListNode(-1)
    var tail: ListNode? = dummyHead
    var curr1: ListNode? = l1
    var curr2: ListNode? = l2
    var addRemainder = false

    // Using two pointers, consume elements from each respective linked list until no longer possible.
    // Ensure at each iteration we're checking for carry-over
    while curr1 != nil || curr2 != nil || addRemainder {
        let curr1Val = curr1?.val ?? 0
        let curr2Val = curr2?.val ?? 0
        let total = curr1Val + curr2Val + (addRemainder ? 1 : 0)
        let remainder = total % 10

        addRemainder = total >= 10

        tail?.next = ListNode(remainder)
        tail = tail?.next

        if curr1 != nil {
            curr1 = curr1?.next
        }
        if curr2 != nil {
            curr2 = curr2?.next
        }
    }

    return dummyHead.next
}
