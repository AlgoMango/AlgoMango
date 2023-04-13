//230413_15655_N과M(7)_백준
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]
let m = input[1]

var board: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
board.sort(by: <) // 정렬

var array: [String] = Array(repeating: "", count: m) // String 배열로 선언

var answer = ""

func recursive(number: Int) {
    if number == m {
        answer += array.joined(separator: " ") // map의 시간복잡도는 N이기 때문에 그런듯..?
        answer += "\n"
        return
    }
    
    for index in 0..<board.count {
        array[number] = String(board[index])  // String으로 변환
        recursive(number: number + 1)
    }
}

recursive(number: 0)
print(answer)
