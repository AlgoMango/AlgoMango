//230421_1912연속합_백준

/*
원본 board: 10, -4, 3,  1,  5,   6,  -35,  12,  21,   -1
변경 board: 10,  6, 9, 10, 15,  21,  -14,  12,  33,   32
 */


let testcase = Int(readLine()!)!

var board = readLine()!.split(separator: " ").map { Int(String($0))! }

for index in 1..<board.count {
    board[index] = max(board[index], board[index - 1] + board[index])
}

print(board.max()!)
