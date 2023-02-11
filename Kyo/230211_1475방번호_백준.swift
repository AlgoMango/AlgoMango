//230211_1475방번호_백준

let input = readLine()!.map { String($0) }
var board = Array(repeating: 0, count: 9)
var result = 0

for number in input {
    if number == "9" { // 9면 6에다가 +1 처리해줌
        board[6] += 1
        continue
    }
    board[Int(number)!] += 1
}

if board[6] % 2 == 0 {
    board[6] = board[6] / 2
} else {
    board[6] = board[6] / 2 + 1
}

for number in board {
    result = max(result, number)
}

print(result)


