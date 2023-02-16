// https://www.acmicpc.net/problem/1158
// 다시 풀어보기

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let interval: Int = input[1]
let total: Int = input[0]
var index: Int = interval - 1
var numbers: [Int] = Array(1...total)
var result: [Int] = []

while true {
    result.append(numbers.remove(at: index))
    if numbers.isEmpty { break }
    index = (index + (interval - 1)) % numbers.count
}

print("<\(result.map {String($0) }.joined(separator: ", "))>")

// 나머지로 풀기...... 
