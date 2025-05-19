//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-19.
//

import Foundation

/*
 https://leetcode.com/problems/car-fleet/

 There are n cars at given miles away from the starting mile 0, traveling to reach the mile target.

 You are given two integer array position and speed, both of length n, where position[i] is the
 starting mile of the ith car and speed[i] is the speed of the ith car in miles per hour.

 A car cannot pass another car, but it can catch up and then travel next to it at the speed of the slower car.

 A car fleet is a car or cars driving next to each other. The speed of the car fleet is the minimum speed of any car in the fleet.

 If a car catches up to a car fleet at the mile target, it will still be considered as part of the car fleet.

 Return the number of car fleets that will arrive at the destination.
 */

public func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    // 1. zip position and speed into an array of tuples
    let cars = zip(position, speed)
        .sorted(by: { ($0.0 == $1.0) ? $0.1 < $1.1 : $0.0 < $1.0 })
        .reversed() // 2. Sort them in reverse order (closest car to target comes first)

    var stack = [Double]() // 3. Keep track of cars time to target

    for (pos, speed) in cars {
        // 4. Calculate the time it takes for current car to reach target
        let timeForCurrentCar = Double(target - pos) / Double(speed)

        /*
         Idea:
         Starting from the car closest to the destination (furthest ahead), move backward and check:
           - If a car behind arrives sooner or at the same time, it joins the current fleet.
           - If it takes longer, it forms a new fleet.
         */

        // 5. Compare current car with car in front(top of stack)
        // If current car has a longer time, it will form a new fleet
        if stack.isEmpty || timeForCurrentCar > stack.last! {
            stack.append(timeForCurrentCar)
        }
    }

    return stack.count
}
