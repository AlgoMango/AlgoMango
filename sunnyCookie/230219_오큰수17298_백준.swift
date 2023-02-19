// https://www.acmicpc.net/problem/17298

import Foundation

let count: Int = Int(readLine()!)!
let values: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer: [Int] = Array(repeating: -1, count: count) // ⭐️⭐️⭐️ 기본값으로 -1을 넣어두기
var valueStack: [Int] = []
var indexStack: [Int] = []

for index in 0..<count {
    while !valueStack.isEmpty {
        if values[index] > valueStack.last! {
            answer[indexStack.last!] = values[index]
            indexStack.removeLast()
            valueStack.removeLast()
        } else {
            break
        }
    }

    valueStack.append(values[index])
    indexStack.append(index)
}

print(answer.map { String($0) }.joined(separator: " "))
