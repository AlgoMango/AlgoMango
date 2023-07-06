// 2:02 - 2: 25
// 금메달 수, 은메달 수 ,동메달 수
// 국가 등수는 자신보다 더잘한 나라수 + 1로 책정
// 등수는 같을 수 있다.

let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
let country = firstInput[0]
let find = firstInput[1]

var target: [Int] = []
var board: [[Int]] = []
for _ in 0..<country {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    if input[0] == find {
        target = input
    }
    board.append(input)
}

board = board.sorted { first, second in
    if first[1] > second[1] { return true }
    else if first[1] == second[1] {
        if first[2] > second[2] { return true }
        else if first[2] == second[2] {
            if first[3] > second[3] { return true }
        }
    }
    
    return false
}

var index = 0
var ranking = 1

while true {
    if board[index][0] == find { break }
    
    if board[index][1] > target[1] {
        ranking += 1
    } else if board[index][2] > target[2] {
        ranking += 1
    } else if board[index][3] > target[3] {
        ranking += 1
    }
    
    index += 1
}

print(ranking)
