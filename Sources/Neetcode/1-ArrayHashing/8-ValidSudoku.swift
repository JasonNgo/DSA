/*
 You are given a a 9 x 9 Sudoku board board. A Sudoku board is valid if the following rules are followed:

     Each row must contain the digits 1-9 without duplicates.
     Each column must contain the digits 1-9 without duplicates.
     Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without duplicates.

 Return true if the Sudoku board is valid, otherwise return false

 Note: A board does not need to be full or be solvable to be valid.
 */

/*
 let gridSize = N          // overall grid size (e.g. 16x16)
 let boxSize = B           // sub-box size (e.g. 4x4)

 boxRow = row / boxSize
 boxCol = col / boxSize

 numBoxCols = gridSize / boxSize

 boxIndex = boxRow * numBoxCols + boxCol
 */

public func isValidSudoku(_ board: [[String]]) -> Bool {
    var rows = Array(repeating: Set<String>(), count: board.count)
    var columns = Array(repeating: Set<String>(), count: board.count)
    var boxes = Array(repeating: Set<String>(), count: board.count)

    for row in 0..<9 {
        for col in 0..<9 {
            let value = board[row][col]
            guard value != "." else { continue }

            if rows[row].contains(value) {
                return false
            }

            if columns[col].contains(value) {
                return false
            }

            let boxRow = row / 3
            let boxColumn = col / 3
            let boxIndex = boxRow * 3 + boxColumn

            if boxes[boxIndex].contains(value) {
                return false
            }

            rows[row].insert(value)
            columns[col].insert(value)
            boxes[boxIndex].insert(value)
        }
    }

    return true
}
