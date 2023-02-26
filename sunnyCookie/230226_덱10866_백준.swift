// https://www.acmicpc.net/problem/10866

import Foundation

let orderCount: Int = Int(readLine()!)!
var enqueue: [Int] = []
var dequeue: [Int] = []

for _ in 0..<orderCount {
    let order: String = readLine()!

    switch order {
    case "empty":
        dequeue.isEmpty && enqueue.isEmpty ? print(1) : print(0)

    case "pop_front":
        if dequeue.isEmpty && enqueue.isEmpty {
            print(-1)
        } else if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
            print(dequeue.removeLast())
        } else {
            print(dequeue.removeLast())
        }

    case "pop_back":
        if dequeue.isEmpty && enqueue.isEmpty {
            print(-1)
        } else if enqueue.isEmpty {
            print(dequeue.removeFirst())
        } else {
            print(enqueue.removeLast())
        }

    case "size":
        print(enqueue.count + dequeue.count)

    case "front":
        if dequeue.isEmpty && enqueue.isEmpty {
            print(-1)
        } else if dequeue.isEmpty {
            print(enqueue.first!)
        } else {
            print(dequeue.last!)
        }

    case "back":
        if dequeue.isEmpty && enqueue.isEmpty {
            print(-1)
        } else if enqueue.isEmpty {
            print(dequeue.first!)
        } else {
            print(enqueue.last!)
        }

    default:
        let orders = order.split(separator: " ").map { String($0) }
        let value = Int(orders[1])!

        if orders[0] == "push_front" {
            dequeue.append(value)
        }

        if orders[0] == "push_back" {
            enqueue.append(value)
        }
    }
}
