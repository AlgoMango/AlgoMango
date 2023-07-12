// 230712_17615볼모으기_백준

// 맨 뒤에서부터 검사?
// 왜 부분성공? 다 되는데..

let totalCount = Int(readLine()!)!
var board: [String] = readLine()!.map { String($0) }

// Red을 옮기는 경우
var rMoveCount = 0
var index  = totalCount - 1
var tempBoard = board
var flag = false

while index >= 0 {
    if tempBoard[index] == "R" && flag == false {
        index -= 1
        continue
    }
    
    if tempBoard[index] == "R" && flag {
        rMoveCount += 1
        index -= 1
        continue
    }
    
    if tempBoard[index] == "B" {
        flag = true
        index -= 1
    }
}

// Blue를 옮기는 경우
var bMoveCount = 0
index  = totalCount - 1
tempBoard = board
flag = false

while index >= 0 {
    if tempBoard[index] == "B" && flag == false {
        index -= 1
        continue
    }
    
    if tempBoard[index] == "B" && flag {
        bMoveCount += 1
        index -= 1
        continue
    }
    
    if tempBoard[index] == "R" {
        flag = true
        index -= 1
    }
}

print(min(rMoveCount, bMoveCount))

