//
//  File.swift
//  DSA
//
//  Created by Jason Ngo on 2025-05-13.
//

import Foundation

public func encodeString(_ strings: [String], delimiter: String = "#") -> String {
    return strings.map { "\($0.count)\(delimiter)\($0)" }.joined()
}

public func decodeString(_ string: String, delimiter: Character = "#") -> [String] {
    _decodeString(string)
}

fileprivate func _decodeString(_ string: String, delimiter: Character = "#") -> [String] {
    var result: [String] = []

    var i = string.startIndex

    while i < string.endIndex {
        var j = i
        while string[j] != delimiter {
            j = string.index(after: j)
        }

        let count = Int(string[i..<j]) ?? 0
        i = string.index(after: i)

        let startRange = string.index(after: j)
        let endRange = string.index(j, offsetBy: 1 + count)

        let decodedString = String(string[startRange..<endRange])
        result.append(decodedString)

        guard string.index(after: i) < string.endIndex else { break }
        i = string.index(j, offsetBy: 1 + count)
    }

    return result
}
