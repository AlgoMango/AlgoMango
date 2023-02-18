// https://www.acmicpc.net/problem/10828

import Foundation

let count: Int = Int(readLine()!)!
var stack: [Int] = []

for _ in 1...count {
    let order: String = readLine()!
    switch order {
    case "pop":
        stack.isEmpty ? print(-1) :  print(stack.removeLast())
    case "size":
        print(stack.count)
    case "empty":
        stack.isEmpty ? print(1) :  print(0)
    case "top":
        stack.isEmpty ? print(-1) : print(stack.last!)
    default:
        let orders = order.split(separator: " ") 
        let number = Int(orders[1])!
        stack.append(number)
    }
}
