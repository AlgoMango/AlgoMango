// https://www.acmicpc.net/problem/1182

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, s) = (input[0], input[1])
var numbers: [Int] = []
var answer: Int = 0

numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

func recursion(idx: Int, part: [Int]) {
    if part.count > numbers.count {
        return
    }

    for (idx2, num) in numbers.enumerated() {
        if idx2 > idx {
            recursion(idx: idx2, part: part + [num])
        }
    }

    if part.reduce(0, +) == s {
        answer += 1
    }
}

for (idx, num) in numbers.enumerated() {
    recursion(idx: idx, part: [num])
}

print(answer)
