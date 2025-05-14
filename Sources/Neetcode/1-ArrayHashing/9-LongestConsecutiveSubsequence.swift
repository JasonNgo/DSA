/*
 Given an array of integers nums, return the length of the longest consecutive sequence of elements that can be formed.

 A consecutive sequence is a sequence of elements in which each element is exactly 1 greater than the previous element. The elements do not have to be consecutive in the original array.

 You must write an algorithm that runs in O(n) time.
 */

public func longestConsecutiveSubsequence(_ nums: [Int]) -> Int {
    _optimalLongestConsecutiveSubsequence(nums)
}

fileprivate func _optimalLongestConsecutiveSubsequence(_ nums: [Int]) -> Int {
    let map = Set(nums)
    var length = 0

    for num in nums {

        // check if the number is the start of a subsequence
        if map.contains(num - 1) {
            // not the start of a subsequence skip
            continue
        }

        // we know our current number is the start of a subsequence
        // keep trying to grow the subsequence until we can no longer
        var subsequence: [Int] = [num]
        while map.contains(subsequence.last! + 1) {
            subsequence.append(subsequence.last! + 1)
        }

        length = max(length, subsequence.count)
    }

    return length
}

// First Try
fileprivate func _longestConsecutiveSubsequence(_ nums: [Int]) -> Int {
    var subsequences: [Set<Int>] = []

    for num in nums {
        if subsequences.isEmpty {
            subsequences.append(Set([num]))
            continue
        }

        var addedToSubsequence = false
        for (index, subsequence) in subsequences.enumerated() {
            if subsequence.contains(num - 1) {
                subsequences[index].insert(num)
                addedToSubsequence = true
            } else if subsequence.contains(num + 1) {
                subsequences[index].insert(num)
                addedToSubsequence = true
            }
        }

        if !addedToSubsequence {
            subsequences.append(Set([num]))
        }
    }

    var count = 0
    for subsequence in subsequences {
        if subsequence.count > count {
            count = subsequence.count
        }
    }

    return count
}
