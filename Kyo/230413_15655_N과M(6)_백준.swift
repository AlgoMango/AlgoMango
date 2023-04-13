//230413_15655_N과M(6)_백준
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]
let m = input[1]

var board: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
board.sort(by: <)

var visit: [Bool] = Array(repeating: false, count: n)
var array: [Int] = Array(repeating: 0, count: m)

var answer = ""

func recursive(number: Int, start: Int) {
    if number == m {
        answer += array.map { String($0) }.joined(separator: " ")
        answer += "\n"
        return
    }
    
    for index in start..<board.count {
        if visit[index] { continue }
        
        visit[index] = true
        array[number] = board[index]
        recursive(number: number + 1, start: index)
        visit[index] = false
    }
}

recursive(number: 0, start: 0)
print(answer)
