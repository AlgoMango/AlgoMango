//230421_1003피보나치함수_백준

let testcase = Int(readLine()!)!

var board: [(Int, Int)] = Array(repeating: (0, 0), count: 41)
board[0] = (1, 0)
board[1] = (0, 1)
board[2] = (1, 1)

for index in 2..<41 {
    board[index] = (board[index - 1].0 + board[index - 2].0, board[index - 1].1 + board[index - 2].1)
}

for _ in 0..<testcase {
    let input = Int(readLine()!)!
    print("\(board[input].0) \(board[input].1)")
}

/*
 0 -> 1 0
 1 -> 0 1
 2 -> f(1) + f(0) -> 1 1
 3 -> 1 2
 4 -> 2 3
 5 -  3 5
 6 -> 5.8
 */
