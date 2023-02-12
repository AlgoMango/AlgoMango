// BOJ 10807 개수 세기
// https://www.acmicpc.net/problem/10807

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let v = Int(readLine()!)!

var dict: [Int: Int] = [:]

for num in numbers {
    dict[num, default: 0] += 1
}

print(dict[v, default: 0])
