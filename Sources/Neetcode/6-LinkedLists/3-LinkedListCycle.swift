//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-29.
//

import Core
import Foundation

/*
 https://leetcode.com/problems/linked-list-cycle/description/

 Given head, the head of a linked list, determine if the linked list has a cycle in it.

 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

 Return true if there is a cycle in the linked list. Otherwise, return false.
 */

public func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil {
        return false
    }

    if head?.next == nil {
        return false
    }

    var slow = head
    var fast = head

    while fast != nil {
        slow = slow?.next
        fast = fast?.next?.next

        if slow === fast {
            return true
        }
    }

    return false
}
