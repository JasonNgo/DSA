//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-29.
//

import Foundation

/*
 You are given the head of a singly linked-list.

 The positions of a linked list of length = 7 for example, can intially be represented as:
 [0, 1, 2, 3, 4, 5, 6]

 Reorder the nodes of the linked list to be in the following order:
 [0, 6, 1, 5, 2, 4, 3]

 Notice that in the general case for a list of length = n the nodes are reordered to be in the following order:
 [0, n-1, 1, n-2, 2, n-3, ...]

 You may not modify the values in the list's nodes, but instead you must reorder the nodes themselves.
 */

import Core

public func reorderList(_ head: ListNode?) {
    if head == nil {
        return
    }

    // find the middle point
    var (slow, fast) = (head, head)
    while fast != nil && fast?.next != nil {
        (slow, fast) = (slow?.next, fast?.next?.next)
    }

    // reverse the linked list from the middle point
    var curr = slow
    var prev: ListNode?
    while curr != nil {
        let next = curr?.next

        curr?.next = prev
        prev = curr
        curr = next
    }

    // merge two linked lists
    var first = head
    var second = prev
    while second?.next != nil {
        var tmp = first?.next
        first?.next = second
        first = tmp

        tmp = second?.next
        second?.next = first
        second = tmp
    }
}
