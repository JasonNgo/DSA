//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-14.
//

import Foundation

/*
 https://leetcode.com/problems/reverse-linked-list/description/

 Given the head of a singly linked list, reverse the list, and return the reversed list.
 */

public func reverseLinkedList(_ head: ListNode?) -> ListNode? {
    var curr = head
    var prev: ListNode?

    while curr != nil {
        let next = curr?.next

        curr?.next = prev
        prev = curr
        curr = next
    }

    return prev
}
