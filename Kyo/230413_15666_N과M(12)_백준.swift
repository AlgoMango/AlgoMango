//230413_15666_N과M(12)_백준
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]
let m = input[1]

var board = readLine()!.split(separator: " ").map { Int(String($0))! }
board.sort(by: <) // 정렬

var array: [String] = Array(repeating: "", count: m)
var arrayStorage: [[String] : Bool] = [:]

var answer = ""

recursive(number: 0, start: 0)
print(answer)

func recursive(number: Int, start: Int) {
    if number == m {
        if arrayStorage[array] == nil {
            arrayStorage[array] = true
            answer += array.joined(separator: " ")
            answer += "\n"
            return
        }
        
        return
    }
    
    // 자기 자신도 포함이면 Visit Check할 필요가 없다.
    for index in start..<board.count {
        array[number] = String(board[index])
        recursive(number: number + 1, start: index)
    }
}
