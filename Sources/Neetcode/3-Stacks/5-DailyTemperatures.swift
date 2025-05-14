//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-14.
//

import Foundation

public func dailyTemperatures(_ temps: [Int]) -> [Int] {
    var output = Array(repeating: 0, count: temps.count)
    var stack: [Int] = []

    for currentDay in 0..<temps.count {
        let currentTemp = temps[currentDay]

        while let lastDay = stack.last, currentTemp > temps[lastDay] {
            let difference = currentDay - lastDay
            output[lastDay] = difference
            stack.removeLast()
        }
        
        stack.append(currentDay)
    }

    return output
}
