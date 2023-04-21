//230421_2193이친수_백준

/*
 이친수는 이진수인데,
 1. 0으로 시작하지않는다.
 2. 1이 두 번 연속으로 나타나지 않는다.
 */

// n자리 이친수를 구해야한다.
let n = Int(readLine()!)!

var board: [Int] = Array(repeating: 0, count: 91)

board[1] = 1
board[2] = 1

for index in 3..<91 {
    board[index] = board[index - 1] + board[index - 2]
}

print(board[n])

/*
 1자리 이친수 -> 1 | 1개
 2자리 이친수 -> 10 | 1개
 3자리 이친수 -> 100, 101 | 2개
 4자리 이친수 -> 1000, 1001, 1010 | 3개
 5자리 이친수 -> 10000, 10001, 10101, 10100, 10010 | 5개
*/
