// https://www.acmicpc.net/problem/10773

import Foundation

let count: Int = Int(readLine()!)!
var stack: [Int] = []

for _ in 1...count {
    let number: Int = Int(readLine()!)!
    switch number {
    case 0:
        stack.removeLast()
    default:
        stack.append(number)
    }
}

print(stack.reduce(0,+))
