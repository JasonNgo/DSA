//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-13.
//

import Foundation

public func arraysOfArraysEqualUnordered<T: Comparable>(_ a: [[T]], _ b: [[T]]) -> Bool {
    guard a.count == b.count else { return false }

    // Sort each inner array
    let sortedInnerA = a.map { $0.sorted() }
    let sortedInnerB = b.map { $0.sorted() }

    // Sort the outer arrays lexicographically
    let sortedA = sortedInnerA.sorted { $0.lexicographicallyPrecedes($1) }
    let sortedB = sortedInnerB.sorted { $0.lexicographicallyPrecedes($1) }

    return sortedA == sortedB
}

public func arraysEqualUnordered<T: Hashable>(_ array1: [T], _ array2: [T]) -> Bool {
    guard array1.count == array2.count else { return false }

    var counts = [T: Int]()

    // Count elements in array1
    for item in array1 {
        counts[item, default: 0] += 1
    }

    // Subtract counts based on array2
    for item in array2 {
        if let count = counts[item] {
            if count == 1 {
                counts.removeValue(forKey: item)
            } else {
                counts[item] = count - 1
            }
        } else {
            return false  // Extra item in array2
        }
    }

    return counts.isEmpty
}
