// https://www.acmicpc.net/problem/2493

import Foundation

let count: Int = Int(readLine()!)!
var tops: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer: [Int] = Array(repeating: 0, count: count)
var indexStack: [Int] = []
var valueStack: [Int] = []

for (index, value) in tops.enumerated().reversed() {
    while !valueStack.isEmpty {
        if value > valueStack.last! {
            answer[indexStack.removeLast()] = index + 1
            valueStack.removeLast()
        } else {
            break
        }
    }

    indexStack.append(index)
    valueStack.append(value)
}


print(answer.map{String($0)}.joined(separator: " "))

// 큰 탑을 아직 만나지 못한 작은 탑들을 스택에 담아두는 
//
//
//
//
// 시간초과 (n^2)

let count: Int = Int(readLine()!)!
var tops: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer: [Int] = Array(repeating: 0, count: count)

var orderIndex: Int = count - 1
var index: Int = count - 2

for _ in 1...count {
    while true {
        if index >= 0 && tops[index] > tops[orderIndex] {
            answer[orderIndex] = index + 1
            break
        } else if index < 0 {
            break
        } else {
            index -= 1
        }
    }

    orderIndex -= 1
    index = orderIndex - 1
}

print(answer.map{String($0)}.joined(separator: " "))

