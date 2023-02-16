// BOJ 3273 두 수의 합
// https://www.acmicpc.net/problem/3273

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let x = Int(readLine()!)!

var dict: [Int: Int] = [:]
var answer: Int = 0

for num in numbers {
    let gap = x - num
    if dict[gap] != nil {
        answer += 1
        dict[num, default: 0] = num
    } else {
        dict[num, default: 0] = num
    }
}

print(answer)
