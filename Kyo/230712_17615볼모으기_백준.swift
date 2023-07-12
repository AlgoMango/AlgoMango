// 230712_17615볼모으기_백준

// 맨 뒤에서부터 검사?
// 왜 부분성공? 다 되는데..
// 왼쪽으로 모으는 경우만 생각해서.. 오른쪽으로 공을 모으는 경우가 최소일 경우도 있다. 

let totalCount = Int(readLine()!)!
var board: [String] = readLine()!.map { String($0) }

var answer: [Int] = []
// R을 왼쪽으로 옮기는 경우
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
answer.append(rMoveCount)

// B를 왼쪽으로 옮기는 경우
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
answer.append(bMoveCount)

// R을 오른쪽으로 옮기는 경우
rMoveCount = 0
index  = 0
tempBoard = board
flag = false

while index < totalCount {
    if tempBoard[index] == "R" && flag == false {
        index += 1
        continue
    }
    
    if tempBoard[index] == "R" && flag {
        rMoveCount += 1
        index += 1
        continue
    }
    
    if tempBoard[index] == "B" {
        flag = true
        index += 1
    }
}
answer.append(rMoveCount)

// B를 오른쪽으로 옮기는 경우
bMoveCount = 0
index  = 0
tempBoard = board
flag = false

while index < totalCount {
    if tempBoard[index] == "B" && flag == false {
        index += 1
        continue
    }
    
    if tempBoard[index] == "B" && flag {
        bMoveCount += 1
        index += 1
        continue
    }
    
    if tempBoard[index] == "R" {
        flag = true
        index += 1
    }
}
answer.append(bMoveCount)

print(answer.min()!)

