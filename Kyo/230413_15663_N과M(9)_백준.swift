//230413_15663_N과M(9)_백준
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]
let m = input[1]

var board: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
board.sort(by: <) // 정렬

var visit: [Bool] = Array(repeating: false, count: 10001)

var array: [String] = Array(repeating: "", count: m)

// 배열로해서 contain사용했었으나 시간초과 발생. contain 시간 복잡도 : O(N)
// Dictionary Key값으로 contain여부 찾으니깐 O(1)이다.
var arrayStorage: [[String] : Bool] = [:]

var answer = ""

var current = -1
func recursive(number: Int) {
    
    if number == m {
        if arrayStorage[array] == nil {  // 한번도 추가된 적이 없으면
            arrayStorage[array] = true
            answer += array.joined(separator: " ")
            answer += "\n"
            return
        }
        
        // 중복이면
        return
    }
    
    for index in 0..<board.count {
        if visit[index] { continue }
        
        visit[index] = true
        array[number] = String(board[index])
        current = board[index]
        recursive(number: number + 1)
        
        visit[index] = false
    }
}

recursive(number: 0)
print(answer)
