// 230711_2467용액_백준
// 30분내
let total = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var nearZero = 2000000002   // 여기가 핵심인듯

// 투포인터 시작
var start = 0
var end = total - 1

var answer: [Int] = []
while start < end {
    let result = input[end] + input[start]

    if nearZero >= abs(result) {
        nearZero = abs(result)
        answer = [input[start], input[end]]
    }
    
    // 포인터 이동
    if result > 0 {
        end -= 1
    } else {
        start += 1
    }
}

print(answer[0], answer[1])
