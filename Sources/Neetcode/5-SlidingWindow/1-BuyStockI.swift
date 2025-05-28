//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-28.
//

import Foundation

/*
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/

 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
 */

public func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 1 else {
        return 0
    }

    var leftBuy = 0
    var rightSell = 1
    var maxProfit = 0

    while rightSell < prices.count {
        if prices[rightSell] < prices[leftBuy] {
            leftBuy = rightSell
        } else {
            let profit = prices[rightSell] - prices[leftBuy]
            maxProfit = max(maxProfit, profit)
        }

        rightSell += 1
    }

    return maxProfit
}
