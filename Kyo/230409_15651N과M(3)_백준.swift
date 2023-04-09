//230409_15651N과M(3)_백준

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]
let m = input[1]

var array: [Int] = Array(repeating: 0, count: m)        // 2
var answer = ""

recursive(number: 0) // 실행
print(answer)       // 출력

// Recursive
func recursive(number: Int) {
    if number == m {
        // for 문으로 출력하면 시간초과 발생 - 한번에 출력하게 끔 변경
        answer += array.map { String($0) }.joined(separator: " ")
        answer += "\n"
        return
    }
    
    // 방문 체크 안해도 된다.
    for index in 0..<n {
        array[number] = index + 1
        recursive(number: number + 1)
    }
}
