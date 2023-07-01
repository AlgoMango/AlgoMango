// 230701_2304창고다각형_백준
// 양 옆에서 접근해서 가장 큰 막대기 일경우를 알아야하나?

var input = Int(readLine()!)!

var board: [[Int]] = []
var height: [Int] = []
for _ in 0..<input {
    // x축, 높이
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}

board.sort { first, second in
    return first.first! < second.first!
}

for item in board {
    height.append(item[1])
}

var maxHeight = height.max()!
var leftmaxHeightIndex = height.firstIndex(of: maxHeight)!
var rightmaxHeightIndex = height.lastIndex(of: maxHeight)!

var leftMax = 0
for index in 0..<board.count {
    if board[index][1] == maxHeight {
        break
    }
    
    if leftMax > board[index][1] {
        board[index][1] = leftMax
    } else {
        leftMax = board[index][1]
    }
}

var rightMax = 0
for index in (0..<board.count).reversed() {
    if board[index][1] == maxHeight {
        break
    }
    
    if rightMax > board[index][1] {
        board[index][1] = rightMax
    } else {
        rightMax = board[index][1]
    }
}

var answer = 0
for index in 0..<leftmaxHeightIndex {
    answer += (board[index + 1][0] - board[index][0]) * board[index][1]
}

for index in (rightmaxHeightIndex+1..<board.count).reversed() {
    answer += (board[index][0] - board[index - 1][0]) * board[index][1]
}

if rightmaxHeightIndex == leftmaxHeightIndex {
    answer += maxHeight
} else {
    answer += (board[rightmaxHeightIndex][0] - board[leftmaxHeightIndex][0] + 1) * maxHeight
}

print(answer)
