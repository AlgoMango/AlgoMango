//230413_15657_N과M(8)_백준
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]
let m = input[1]

var board: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
board.sort(by: <) // 정렬

var array: [String] = Array(repeating: "", count: m)

var answer = ""

func recursive(number: Int, start: Int) {
    if number == m {
        answer += array.joined(separator: " ") // map사용한 코드보다 4ms정도 더 빠름
        answer += "\n"
        return
    }
    
    for index in start..<board.count {
        array[number] = String(board[index])
        recursive(number: number + 1, start: index)
    }
}

recursive(number: 0, start: 0)
print(answer)
