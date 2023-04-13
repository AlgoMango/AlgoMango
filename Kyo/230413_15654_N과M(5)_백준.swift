//230413_15654_N과M(5)_백준
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]
let m = input[1]

var board: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
board.sort(by: <)

var visit: [Bool] = Array(repeating: false, count: n)
var array: [Int] = Array(repeating: 0, count: m)

var answer = ""

func recursive(number: Int) {
    if number == m {
        answer += array.map { String($0) }.joined(separator: " ")
        answer += "\n"
        return
    }
    
    for index in 0..<board.count {
        if visit[index] { continue }
        
        visit[index] = true
        array[number] = board[index]
        recursive(number: number + 1)
        visit[index] = false
    }
}

recursive(number: 0)
print(answer)
