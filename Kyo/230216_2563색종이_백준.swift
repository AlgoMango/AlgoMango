//230216_2563색종이_백준

let testCase = Int(readLine()!)!
var board: [[Int]] = Array(repeating: Array(repeating: 0, count: 100), count: 100)

for _ in 0..<testCase {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    for x in input[1]..<input[1]+10 {
        for y in input[0]..<input[0]+10 {
            board[x][y] = 1
        }
    }
}

var cnt = 0
for i in 0..<100 {
    for j in 0..<100 {
        if board[i][j] == 1 {
            cnt += 1
        }
    }
}

print(cnt)
